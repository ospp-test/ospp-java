### Prepare

#### OS
- openEuler 24.03 (LTS)

#### Dependence
```
sudo dnf install java-21-openjdk-devel 
sudo dnf install maven
```

#### Set default Java
```
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
```

#### Check preparation
```
$ mvn -version                                
Apache Maven 3.6.3 (openEuler 3.6.3-2)
Maven home: /usr/share/maven
Java version: 21.0.2, vendor: BiSheng, runtime: /usr/lib/jvm/java-21-openjdk-21.0.2.12-2.oe2403.x86_64
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "6.11.3-200.fc40.x86_64", arch: "amd64", family: "unix"
```

### Run test (e.g mica-mqtt)
```
cd mica-mqtt
bash mica-mqtt-test.sh
```