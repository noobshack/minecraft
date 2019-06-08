FROM openjdk:11.0.3-slim

ENV MINECRAFT_DIR "/home/minecraft"

WORKDIR "${MINECRAFT_DIR}"
VOLUME "${MINECRAFT_DIR}"

COPY game/ "${MINECRAFT_DIR}"

#ENTRYPOINT ["java -XX:InitialRAMPercentage=75.0 -XX:MaxRAMPercentage=75.0 -XX:MinRAMPercentage=50.0 -jar ${MINECRAFT_DIR}/minecraft_server.1.11.2.jar nogui"]
ENTRYPOINT ["java -XX:InitialRAMPercentage=75.0 -XX:MaxRAMPercentage=75.0 -XX:MinRAMPercentage=50.0 -jar /home/minecraft/minecraft_server.1.11.2.jar nogui"]

EXPOSE 25565
