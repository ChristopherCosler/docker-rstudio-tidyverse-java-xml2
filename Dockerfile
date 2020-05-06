# Base image from https://hub.docker.com/r/rocker/rstudio
FROM rocker/rstudio:3.6.2

# Install java and rJava

RUN apt-get -y update && apt-get install -y \
   openjdk-8-jdk \
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
