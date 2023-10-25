#FROM openjdk:8
#EXPOSE 8082
#ADD target/petclinic.war petclinic.war
#ENTRYPOINT ["java","-jar","/petclinic.war"]

FROM openjdk:11-jre-slim
WORKDIR /application
COPY target/* ./
EXPOSE 8080
ENTRYPOINT [ "java","-jar","petclinic.war" ]
