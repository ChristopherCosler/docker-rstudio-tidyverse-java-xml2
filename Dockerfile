# Base image from https://hub.docker.com/r/rocker/rstudio
FROM rocker/rstudio:3.6.2

# Install java and rJava
RUN sudo add-apt-repository ppa:webupd8team/java
RUN sudo apt-get update
RUN sudo apt-get install oracle-java8-installer

RUN apt-get -y update && apt-get install -y \
   r-cran-rjava \
   libxml2-dev \
   libpq-dev 

##ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
##RUN export JAVA_HOME

# Install further R packages
RUN Rscript -e "install.packages(c('rJava'))" 
RUN R CMD javareconf

# Initialize rocker/rstudio
CMD ["/init"]
