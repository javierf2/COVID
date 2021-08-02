require(readxl)
require(tidyverse)
library(dplyr)
library(stringr)
library(tidyverse)
library(plyr)

setwd("https://drive.google.com/file/d/1hRH1a776YWmkYGyaU7xQjGBGcEB3Q-RY/view?usp=sharing")

temp = list.files(pattern="*.csv")
list2env(
  lapply(setNames(temp, make.names(gsub("*.csv$", "", temp))), 
         read.csv), envir = .GlobalEnv)


