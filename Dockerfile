FROM openjdk:11.0.3-slim

ENV MINECRAFT_DIR "/home/minecraft"

WORKDIR "${MINECRAFT_DIR}"
VOLUME "${MINECRAFT_DIR}"

COPY game/ "${MINECRAFT_DIR}"

CMD ["java \
    -XX:InitialRAMPercentage=75.0 \
    -XX:MaxRAMPercentage=75.0 \
    -XX:MinRAMPercentage=50.0 \
    ${MINECRAFT_DIR}/minecraft_server.jar -jar nogui"]

EXPOSE 25565
