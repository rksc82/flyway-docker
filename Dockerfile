FROM openjdk:8-jre

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

WORKDIR /flyway

ENV FLYWAY_VERSION 5.1.4

RUN curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && ln -s /flyway/flyway /usr/local/bin/flyway

COPY /db-migration/scripts scripts
COPY /db-migration/entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash"]
CMD ["./entrypoint.sh"]