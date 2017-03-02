#!/bin/sh

# This installs R packages from CRAN/MRAN
echo "Installing ggplot2 from CRAN/MRAN"
Rscript -e "install.packages('ggplot2', repos='https://cloud.r-project.org/')"
echo "Installing plotly from CRAN/MRAN"
Rscript -e "install.packages('plotly', repos='https://cloud.r-project.org/')"
echo "Installing ggfortify from CRAN/MRAN"
Rscript -e "install.packages('ggfortify', repos='https://cloud.r-project.org/')"
echo "Installing rmarkdown from CRAN/MRAN"
Rscript -e "install.packages('rmarkdown', repos='https://cloud.r-project.org/')"
echo "Installing devtools from CRAN/MRAN"
Rscript -e "install.packages('devtools', repos='https://cloud.r-project.org/')"
echo "Installing curl from CRAN/MRAN"
Rscript -e "install.packages('curl', repos='https://cloud.r-project.org/')"

echo "Installing radiant"
Rscript -e "install.packages('radiant', repos='https://cloud.r-project.org/')"
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

