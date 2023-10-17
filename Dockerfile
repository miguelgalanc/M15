FROM amazoncorretto:21 AS build

WORKDIR /app/

COPY volumen/Main.java /app/

RUN javac Main.java

FROM amazoncorretto:21 AS execute

WORKDIR /app/

COPY --from=build /app/Main.class /app/Main.class

ENTRYPOINT [ "java", "Main" ]