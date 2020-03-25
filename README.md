**Connect Android Device/Host Emulator to React Native via ADB in Docker Container**

[react-native-community](https://github.com/react-native-community) has a [docker image](https://github.com/react-native-community/docker-android) including android tools (in /opt/android) and npm package manager. But to use emulator on desktop, VNC Server is needed.

In this edited repo, **Xfce4** and **VCN Server** are used to run emulator running the same container. For this, thanks to [queeno](https://github.com/queeno) who provides [Ubuntu with VNC Server](https://github.com/queeno/docker-ubuntu-desktop) without entering password.

But working with emulator takes you longer time than with real android phone. For this, you need two port on your host that are **5037** and **8081** mapping with container.

All the resource of the ports such as **8081** should be **in the container**, but **5037** on the host.

In the edited container, there is **SSH Server** running after booting.

Root password is: **passwd**

**For forwarding the port 5037**

As you know [windows 10 ships with linux kernel](https://github.com/microsoft/WSL2-Linux-Kernel). If you are using Wİndows 10 as host, setting openssh server up will make you feel painful. So **don't try ssh port listen forward from container to host**, but **remote forward** from host to container.

The edited container ssh port (**:22**) maps with the port **5022** on the host.

You can forward this on the host like that:

> $ ssh -T -N -R5037:127.0.0.1:5037 root@127.0.0.1 -p 5022

After connecting you android device on the host, then if you could see your device in the list after typing on the host console `adb device` , you would see more than after the same typing on the container. 

Try Your First App

    $ cd ~
    $ react-native init test
    $ cd test
    $ react-native start

and in the new terminal on the same path:

> $ react-native run-android

if you get just white page, you could re-run the last command.

If you want to work on the container desktop, you could use **VNC Viewer**

IP:PORT **127.0.0.1:5901**
