#!/bin/bash
/snap/bin/gcloud compute disks list --format='value(name,zone)'| while read DISK_NAME ZONE; do
  /snap/bin/gcloud compute disks snapshot $DISK_NAME --snapshot-names anual-${DISK_NAME:0:31}-$(date "+%Y-%m-%d") --zone $ZONE
done

#