# docker-rstudio-tidyverse-java-xml2
rocker/rstudio with tidyverse, xml2, java and rJava

# Run

Clone repository
git clone https://github.com/ChristopherCosler/docker-rstudio-tidyverse-java-xml2

Build image
docker build -t myname:myimage .

Start docker with either: docker run -d myname:myimage 
or: docker run -d --name rstudio1 -p 8787:8787 \
    -e PASSWORD=mypassword \
    myname:myimage
