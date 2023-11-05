# Use the official OpenJDK 11 base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the local filesystem into the container
COPY target/*.war ./app.war

# Expose the port that the application will listen on (if needed)
EXPOSE 8082

# Define the command to run your application
CMD ["java", "-jar", "petclinic.war"]

#FROM openjdk:8
#EXPOSE 8080
#ADD target/petclinic.war petclinic.war
#ENTRYPOINT ["java","-jar","/petclinic.war"]