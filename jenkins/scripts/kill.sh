#!/usr/bin/env sh

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'
set -x
if [ -f .pidfile ]; then
  PID=$(cat .pidfile)

  # Check if process exists before killing
  if ps -p $PID > /dev/null 2>&1; then
    kill $PID
  else
    echo "Process already stopped"
  fi
fi
