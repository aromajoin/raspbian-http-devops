#!/bin/bash
set -e

# Figure out where this cript is located
SELFDIR="`dirname \"$0\"`"
SELFDIR="`cd \"$SELFDIR\" && pwd`"

echo "$SELFDIR"
# Run the actual app using the bundle Ruby interpreter
exec "$SELFDIR/lib/ruby/bin/ruby" "$SELFDIR/lib/app/aroma_on_raspberry.rb"