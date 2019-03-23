# RPi Scripts: Install and configure Gmvault

<u>Not yet completed.</u>

### Dependencies:

```bash
sudo apt-get install python-dev python-pip python-virtualenv python-setuptools
```

### Install:

```bash
cd /home/pi/
wget https://bitbucket.org/gaubert/gmvault-official-download/downloads/gmvault-v1.9.1-src.tar.gz
tar -xvzf gmvault-v1.9.1-src.tar.gz
virtualenv gmvault
cd gmvault-v1.9.1/
~/gmvault/bin/python setup.py install
```

### Crontab:

```bash
0 4 * * 1 bash /home/pi/gmail.sh > /home/pi/gmvault.log
```

### Pi Home:

Create /home/pi/gmail.sh and add:

```bash
#!/bin/bash
/home/pi/gmvault/bin/gmvault sync -d /home/pi/backup/gmvault-db user@gmail.com
```

then:

```bash
chmod +x ~/gmail.sh
```

# Thanks to

https://gist.github.com/zentralwerkstatt/d519f1f9d09e5d3b4a3259d78c2fb663