#!/bin/bash
gcloud compute disks list --format='value(name,zone)'| while read DISK_NAME ZONE; do
  gcloud compute disks snapshot $DISK_NAME --snapshot-names mensal-${DISK_NAME:0:31}-$(date "+%Y-%m-%d") --zone $ZONE
done

if [[ $(uname) == "Linux" ]]; then
  from_date=$(date -d "-1 year" "+%Y-%m-%d")
else
  from_date=$(date -v -1y "+%Y-%m-%d")
fi
gcloud compute snapshots list --filter="creationTimestamp<$from_date" --regexp "(mensal.*)" --uri | while read SNAPSHOT_URI; do
   gcloud compute snapshots delete -q $SNAPSHOT_URI
done
#