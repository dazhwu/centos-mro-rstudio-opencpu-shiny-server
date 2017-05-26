#!/bin/sh

# This installs R packages from MRAN
echo "Installing ggplot2 from MRAN"
Rscript -e "install.packages('ggplot2')"
echo "Installing plotly from MRAN"
Rscript -e "install.packages('plotly')"
echo "Installing ggfortify from MRAN"
Rscript -e "install.packages('ggfortify')"
echo "Installing rmarkdown from MRAN"
Rscript -e "install.packages('rmarkdown')"
echo "Installing devtools from MRAN"
Rscript -e "install.packages('devtools')"
echo "Installing curl from MRAN"
Rscript -e "install.packages('curl')"

echo "Installing radiant from MRAN"
Rscript -e "install.packages('radiant')"
git clone https://github.com/radiant-rstats/radiant.git /srv/shiny-server/radiant/



# This installs R packages from github
#echo "Installing hadley/dplyr from github"
#Rscript -e "library(devtools); install_github('dplyr', 'hadley')"

# This installs opencpu webapps from github
echo "Installing appdemo, gitstats, tvscore and qitools/charts opencpu webapp"
Rscript -e "library(devtools); install_github('mjmg/appdemo')"
Rscript -e "library(devtools); install_github('mjmg/gitstats')"
Rscript -e "library(devtools); install_github('mjmg/tvscore')"
Rscript -e "library(devtools); install_github('qitools/charts')"


# This installs R packages under Bioconductor
echo "Installing Biobase from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('Biobase')"
echo "Installing EBImage from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('EBImage')"
echo "Installing BiocStyle from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('BiocStyle')"

