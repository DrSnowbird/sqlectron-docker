# sqlectron-docker
[![](https://images.microbadger.com/badges/image/openkbs/sqlectron-docker.svg)](https://microbadger.com/images/openkbs/sqlectron-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/sqlectron-docker.svg)](https://microbadger.com/images/openkbs/sqlectron-docker "Get your own version badge on microbadger.com")

* SQLectron (SQL Client) + Java 8 JDK + Maven 3.5 + Python 3.5 + Gradle + X11 (display GUI)

# License Agreement
By using this image, you agree the [Oracle Java JDK License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
This image contains [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html). You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

# Components
* SQLectron (SQL Client) 
* java version "1.8.0_181"
  Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
  Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)
* Apache Maven 3.5.3
* Python 3.5.2
* X11 display desktop
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

# Run (recommended for easy-start)
Image is pulling from openkbs/sqlectron-docker
```
./run.sh
```

# Build
You can build your own image locally.
```
./build.sh
```

# Other docker-based IDE
* [openkbs/sqlectron-docker](https://hub.docker.com/r/openkbs/sqlectron-docker/)
* [openkbs/mysql-workbench](https://hub.docker.com/r/openkbs/mysql-workbench/)
* [openkbs/pgadmin-docker](https://hub.docker.com/r/openkbs/pgadmin-docker/)

# Display X11 Issue
You might see the warning message or something similar in the launching xterm console like below, you can just ignore it. I googled around and some blogs just suggested to ignore since the GUI is still functional ok.
```
** (eclipse:1): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-wrKH8o5rny: Connection refused

** (java:7): WARNING **: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-wrKH8o5rny: Connection refused

```
