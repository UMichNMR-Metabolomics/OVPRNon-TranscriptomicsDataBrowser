# OVPRNon-TranscriptomicsDataBrowser
Hosting for the Shiny app and required RData file for the data browser for non-transcriptomics data from the 2024 OVPR Septic Pig experiments



# Setup and Installation

To run the app, download the app.R file and open it in RStudio. If all the required packages are installed, it can be run right away either by running the command 
```
runApp("app.R")
```
or by clicking on the "Run App" button at the top right of the script panel.

At the moment, in order to use the OVPR Septic Pig Data Browser you must have R Studio installed, as well as the following packages:

- shiny
- bslib
- dplyr
- ggplot2
----------------------------------------------------------------------------------------
All packages can be installed from CRAN by running the following code:

```
install.packages("shiny")
install.packages("bslib")
install.packages("dplyr")
install.packages("ggplot2")
```
----------------------------------------------------------------------------------------

# App Overview

The panel on the left contains an explanation of how the app functions and dropdown menus for selecting the data you'd like to plot. The panel on the right contains the generated plot.

