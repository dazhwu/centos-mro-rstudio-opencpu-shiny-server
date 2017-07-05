#!/bin/sh

# This installs useful R packages from MRAN
echo "Installing plyr from MRAN"
Rscript -e "install.packages('plyr')"
echo "Installing dplyr from MRAN"
Rscript -e "install.packages('dplyr')"
echo "Installing knitr from MRAN"
Rscript -e "install.packages('knitr')"
echo "Installing tidyr from MRAN"
Rscript -e "install.packages('tidyr')"
echo "Installing readr from MRAN"
Rscript -e "install.packages('readr')"
echo "Installing lubridate from MRAN"
Rscript -e "install.packages('lubridate')"
echo "Installing magrittr from MRAN"
Rscript -e "install.packages('magrittr')"
echo "Installing stringr from MRAN"
Rscript -e "install.packages('stringr')"
echo "Installing testthat from MRAN"
Rscript -e "install.packages('testthat')"
echo "Installing htmlwidgets from MRAN"
Rscript -e "install.packages('htmlwidgets')"
echo "Installing rmarkdown from MRAN"
Rscript -e "install.packages('rmarkdown')"
echo "Installing devtools from MRAN"
Rscript -e "install.packages('devtools')"
echo "Installing curl from MRAN"
Rscript -e "install.packages('curl')"

echo "Installing ggplot2 from MRAN"
Rscript -e "install.packages('ggplot2')"
echo "Installing plotly from MRAN"
Rscript -e "install.packages('plotly')"
echo "Installing ggfortify from MRAN"
Rscript -e "install.packages('ggfortify')"

echo "Installing revealjs from MRAN"
Rscript -e "install.packages('revealjs')"


echo "Installing radiant from MRAN"
Rscript -e "install.packages('radiant')"
git clone https://github.com/radiant-rstats/radiant.git /srv/shiny-server/radiant/


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

