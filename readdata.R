require(readxl)
require(tidyverse)
library(dplyr)
library(stringr)
library(tidyverse)
library(plyr)

setwd("/Users/ferdinandjavier/Documents/COVID/datasets/2021")

temp = list.files(pattern="*.csv")
list2env(
  lapply(setNames(temp, make.names(gsub("*.csv$", "", temp))), 
         read.csv), envir = .GlobalEnv)


