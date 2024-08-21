#!/bin/bash

# terminatesessions.sh
# terminate locked sessions with ansible / rb / 2024
#
terminatesessions="{{ terminate_sessions }}"

for i in $(loginctl list-sessions --no-legend | sort -r | awk '{ print $1 }'); do
   if [[ $(loginctl show-session -p LockedHint --value $i) == "yes" ]]; then
      if [[  "$terminatesessions" == "true" ]]; then
        echo "locked Session from $(loginctl show-session -p Name -p Type $i | xargs -d '\n' echo) will be closed."
        loginctl terminate-session $i
      else
        echo "locked sessions found: $(loginctl show-session -p Name -p Type $i | xargs -d '\n' echo)"
      fi
   fi
done
