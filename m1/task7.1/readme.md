
Part A result : a.sh
Part B result : b.sh
Part C result 1 : c.sh
Part C result 2 : echo "* * * * * /home/yas/c.sh /home/yas/test-src /home/yas/test-dst" >> /var/spool/cron/yas
or "crontab -e", then enter that line manually (recommended)
crontab -l (list cronjobs)
crontab -r (delete crontab jobs)
