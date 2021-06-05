# project libraries used
library(shinyAce)
library(shiny)
library(dplyr)
library(markdown)
library(rmarkdown)
library(knitr)
library(ggplot2)


########################################################################################################
# update cran mirror
local({
  r <- getOption("repos");
  r["CRAN"] <- "https://cran.rstudio.com/"
  options(repos=r)
})

# Reference: https://support.rstudio.com/hc/en-us/articles/206827897-Secure-Package-Downloads-for-R
########################################################################################################

# initial Rmd example
# initRmdExample <-
#   paste(c('This is an example taken from the **knitr** package. Press `F4` or `Ctrl+Shift+H` to compile it, and `Ctrl+Alt+I` to insert a code chunk.', '',
#           readLines(system.file('examples', 'knitr-minimal.Rmd', package = 'knitr'))), collapse = '\n')

 
# initRmdExample <-
#   paste(c('This is an example taken from the **knitr** package. Press `F4` or `Ctrl+Shift+H` to compile it, and `Ctrl+Alt+I` to insert a code chunk.', '',
#           readLines(file.path("R","knitExample_Allfeatures.Rmd"))), collapse = '\n')


# initRmdExample <- readLines(file.path("R","knitExample_Allfeatures.Rmd"))
# initRmdExample <- readLines(file.path("R","knitExample_Basic.Rmd"))


########################################################################################################
## Refernce Links
# https://ace.c9.io/#nav=embedding

########################################################################################################