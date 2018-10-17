#!/bin/sh


echo "Installing radiant from MRAN"
Rscript -e "install.packages('radiant')"
git clone https://github.com/radiant-rstats/radiant.git /srv/shiny-server/radiant/

echo "Installing caret from MRAN"
Rscript -e "install.packages('caret')"

echo "Installing mlbench from MRAN"
Rscript -e "install.packages('mlbench')"

echo "Installing neuralnet from MRAN"
Rscript -e "install.packages('neuralnet')"

echo "Installing NeuralNetTools from MRAN"
Rscript -e "install.packages('NeuralNetTools')"

echo "Installing plotmo from MRAN"
Rscript -e "install.packages('plotmo')"

echo "Installing mlearning from MRAN"
Rscript -e "install.packages('mlearning')"

echo "Installing mlr from MRAN"
Rscript -e "install.packages('mlr')"

echo "Installing mlearning from MRAN"
Rscript -e "install.packages('mlearning')"

