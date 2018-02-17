#!/usr/bin/env ruby

require 'readline'

# Prevent Ctrl+C for exiting
trap('INT', 'SIG_IGN')

# List of commands
CMDS = %w[help config-wifi install-app install-jetty exit hello].sort

completion =
  proc do |str|
    case
    when Readline.line_buffer =~ /help.*/i
      puts "Available commands:\n" + CMDS.join("\t").to_s
    when Readline.line_buffer =~ /config-wifi.*/i
      puts 'Setup wifi network...'
      `lib/config-wifi`
    when Readline.line_buffer =~ /install-app.*/i
      puts 'Installing web app...'
      `lib/install-app`
    when Readline.line_buffer =~ /hello.*/i
      puts 'Hello, Welcome to Aromajoin!'
    when Readline.line_buffer =~ /install-jetty.*/i
      puts 'Installing Jetty server...'
      `lib/install-jetty`
    when Readline.line_buffer =~ /exit.*/i
      puts 'Exiting...'
      exit 0
    else
      CMDS.grep(/^#{Regexp.escape(str)}/i) unless str.nil?
    end
  end
# Set completion process
Readline.completion_proc = completion
# Make sure to add a space after completion
Readline.completion_append_character = ' '

# Start console with character -> and make add_hist = true
while line = Readline.readline('-> ', true)
  puts completion.call
  break if line =~ /^quit.*/i || line =~ /^exit.*/i
end
