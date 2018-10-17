#!/bin/sh

# This installs chemometric R packages from MRAN/github/Bioconductor

echo "Installing chemometrics from MRAN"
Rscript -e "install.packages('chemometrics')"

echo "Installing baseline from MRAN"
Rscript -e "install.packages('baseline')"

echo "Installing chemCal from MRAN"
Rscript -e "install.packages('chemCal')"

echo "Installing titrationCurves from MRAN"
Rscript -e "install.packages('titrationCurves')"

#echo "Installing quantchem from MRAN"
#Rscript -e "install.packages('quantchem')"

echo "Installing dtw from MRAN"
Rscript -e "install.packages('ptw')"

echo "Installing ptw from MRAN"
Rscript -e "install.packages('dtw')"

echo "Installing david-clifford/VPdtw from github"
Rscript -e "library(devtools); install_github('david-clifford/VPdtw')"

echo "Installing speaq from MRAN"
Rscript -e "install.packages('speaq')"

echo "Installing MSnbase from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('MSnbase')"

echo "Installing mzR from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('mzR')"

echo "Installing xcms from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('xcms')"

echo "Installing CAMERA from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('CAMERA')"

echo "Installing msdata from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('msdata')"

echo "Installing faahKO from Bioconductor"
Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('faahKO')"

echo "Installing ChemoSpec from MRAN"
Rscript -e "install.packages('ChemoSpec')"

echo "Installing hyperSpec from MRAN"
Rscript -e "install.packages('hyperSpec')"

echo "Installing ChemometricsWithR from MRAN"
Rscript -e "install.packages('ChemometricsWithRData')"

echo "Installing ChemometricsWithR from MRAN"
Rscript -e "install.packages('ChemometricsWithR')"

echo "Installing qicharts from MRAN"
Rscript -e "install.packages('qicharts')"

echo "Installing qicharts2 from MRAN"
Rscript -e "install.packages('qicharts2')"

echo "Installing mdatools from MRAN"
Rscript -e "install.packages('mdatools')"
