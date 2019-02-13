#!/bin/bash
/snap/bin/gcloud compute disks list --format='value(name,zone)'| while read DISK_NAME ZONE; do
  /snap/bin/gcloud compute disks snapshot $DISK_NAME --snapshot-names diario-${DISK_NAME:0:31}-$(date "+%Y-%m-%d") --zone $ZONE
done

if [[ $(uname) == "Linux" ]]; then
  from_date=$(date -d "-30 days" "+%Y-%m-%d")
else
  from_date=$(date -v -30d "+%Y-%m-%d")
fi
/snap/bin/gcloud compute snapshots list --filter="creationTimestamp<$from_date" --regexp "(diario.*)" --uri | while read SNAPSHOT_URI; do
   /snap/bin/gcloud compute snapshots delete -q $SNAPSHOT_URI
done
#