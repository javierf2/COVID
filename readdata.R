require(readxl)
require(tidyverse)
library(dplyr)
library(stringr)
library(tidyverse)
library(plyr)


varsdata <- read.csv(file = "https://raw.githubusercontent.com/javierf2/COVID/c93cfaca70d078691a6c7e6fba5b3a7998376140/NonDomesticVAERSVAX.csv", head = TRUE, sep=",")