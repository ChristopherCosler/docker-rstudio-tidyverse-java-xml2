# Base image from https://hub.docker.com/r/rocker/rstudio
FROM rocker/rstudio:3.6.2

# Install java and rJava
RUN add-apt-repository ppa:webupd8team/java
RUN apt update
RUN apt install oracle-java8-installer

RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \
   libxml2-dev \
   libpq-dev \
   oracle-java8-installer



javac -version

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Install further R packages
##RUN Rscript -e "install.packages(c('rJava', 'tidyverse'))" 

# Initialize rocker/rstudio
CMD ["/init"]
