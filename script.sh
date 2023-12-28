#! /bin/bash
echo What is in this Dir
ls -ltr 
echo 
echo Is Java Installed?
java -version
echo 
echo Is Git installed? 
git --version
echo What about build tools? 
mvn --version
gradle --version
ant -version
echo 
echo Where is the workspace
echo $RUNNER_WORKSPACE
echo
echo Who is running this script?
whoami
echo 
echo How is the disk laid out? 
df
echo
echo What Env Variarables are available? 
env
