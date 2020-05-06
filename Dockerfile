# Base image from https://hub.docker.com/r/rocker/rstudio
FROM rocker/rstudio:3.6.2

# Install java and rJava
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \	
   libxml2-dev \
   libpq-dev 

# Install further R packages
RUN Rscript -e "install.packages(c('rJava', 'tidyverse', 'RJDBC', 'cronR'))" 

# Initialize rocker/rstudio
CMD ["/init"]
