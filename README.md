# gce-snapshot


#download
```
wget https://github.com/fitinge/gce-snapshot/raw/master/snapshot-dia.sh
wget https://github.com/fitinge/gce-snapshot/raw/master/snapshot-mes.sh
wget https://github.com/fitinge/gce-snapshot/raw/master/snapshot-ano.sh
```

#cron
```
0 4 * * * /home/fitinge/snapshot-dia.sh >/dev/null 2>&1
0 3 1 * * /home/fitinge/snapshot-mes.sh >/dev/null 2>&1
0 2 1 1 * /home/fitinge/snapshot-ano.sh >/dev/null 2>&1
```
