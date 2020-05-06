# Base image from https://hub.docker.com/r/rocker/rstudio
FROM rocker/rstudio:latest

# Install java and rJava
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \	
   libxml2-dev \
   libpq-dev 

# Install further R packages
RUN Rscript -e "install.packages(c('rJava', 'tidyverse', 'RJDBC','dbplyr','xtable','sendmailR'), dependencies = TRUE)" 

# Initialize rocker/rstudio
CMD ["/init"]
