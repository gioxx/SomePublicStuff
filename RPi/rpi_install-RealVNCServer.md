# RPi: Install RealVNC (Server)

Install:

```bash
sudo apt-get update
sudo apt-get install realvnc-vnc-server realvnc-vnc-viewer
```

Enable via SSH:

```bash
sudo raspi-config
```

Navigate to **Interfacing Options** —> **VNC** —> **Yes**.



## Thanks to

https://www.raspberrypi.org/documentation/remote-access/vnc/