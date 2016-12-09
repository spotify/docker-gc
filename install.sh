#!/bin/bash
apt-get install git devscripts debhelper build-essential dh-make -y
git clone https://github.com/spotify/docker-gc.git
cd docker-gc
debuild -us -uc -b

dpkg -i ../docker-gc_*_all.deb

cat > /etc/cron.daily/docker-gc << EOL
#!/bin/bash
/usr/sbin/docker-gc
EOL

chmod +x /etc/cron.daily/docker-gc

if run-parts --test /etc/cron.daily/ | grep -q docker-gc; then
  echo Setup correctly, docker-gc is executing daily
else
  echo Setup has not succeeded
fi
