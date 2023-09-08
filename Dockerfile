FROM openjdk:8
MAINTAINER "chintha chinnayya <chinthayadav6@gmail.com>"
EXPOSE 8082
ADD target/petclinic.war petclinic.war
ENTRYPOINT ["java","-jar","/petclinic.war"]
