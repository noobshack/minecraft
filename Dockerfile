FROM openjdk:11.0.3-slim

ENV APPDIR /home/minecraft

WORKDIR $APPDIR
VOLUME $APPDIR

COPY ./minecraft_server.1.11.2.jar /home/minecraft/minecraft_server.jar

ENTRYPOINT ["sh", "-c", "${JAVA_HOME} -jar \
    -XX:InitialRAMPercentage=75.0 \
    -XX:MaxRAMPercentage=75.0 \
    -XX:MinRAMPercentage=50.0 \
    /home/minecraft/minecraft_server.jar nogui"]

EXPOSE 25565
