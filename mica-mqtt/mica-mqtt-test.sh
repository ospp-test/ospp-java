#!/usr/bin/env bash

# prep
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
rm -rf mica-mqtt-test
mkdir mica-mqtt-test
cd mica-mqtt-test

# clone repo
git clone https://gitee.com/dromara/mica-mqtt.git
cd mica-mqtt

# build jars
mvn package -s ../../../settings.xml

# run test
cd ..
nohup java -jar mica-mqtt/example/mica-mqtt-server-spring-boot-example/target/mica-mqtt-server-spring-boot-example.jar > /dev/null 2>&1 &
nohup java -jar mica-mqtt/example/mica-mqtt-client-spring-boot-example/target/mica-mqtt-client-spring-boot-example.jar > client.log 2>&1 &
sleep 60s

# end test
pkill -f mica-mqtt-server-spring-boot-example.jar
pkill -f mica-mqtt-client-spring-boot-example.jar
pkill -f math-game.jar

# test result
cd ..
if grep -q "topic:/test/123" mica-mqtt-test/client.log; then
    rm -rf mica-mqtt-test
    echo "TEST PASSED"
else
    rm -rf mica-mqtt-test
    echo "TEST FAILED"
    exit 1  
fi