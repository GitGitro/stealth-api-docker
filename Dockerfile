FROM gradle:8.3-jdk-alpine AS builder

WORKDIR /app

RUN git clone https://gitlab.com/cosmosapps/stealth-api.git .

ARG URL
ARG KEY
ARG PORT

ENV URL=${URL}
ENV KEY=${KEY}
ENV PORT=${PORT}

RUN sed -i "s|https://stealth.cosmosapps.org|$URL|" /app/server/src/main/resources/stealth-api.yaml

RUN mkdir -p /app/services/reddit/src/main/resources && echo "${KEY}" > /app/services/reddit/src/main/resources/credentials.json

RUN sed -i "s|8080|$PORT|" /app/server/src/main/resources/application.conf

RUN gradle build

FROM openjdk:17-oracle

WORKDIR /app

COPY --from=builder /app/server/build/libs/stealth-api-0.2.0.jar /app/stealth-api.jar

EXPOSE 8080

CMD ["java", "-jar", "stealth-api.jar"]