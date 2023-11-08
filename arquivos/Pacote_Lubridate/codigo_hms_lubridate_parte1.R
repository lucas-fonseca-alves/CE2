##############################################
####### Aula CE2 - Prof. Thais #######
##############################################

library(tidyverse)
library(nycflights13)
library(hms)
library(lubridate)


## Pacote hms

library(tidyverse)
library(hms)
hms(56,34,12)

library(nycflights13)
View(flights)

flights %>%
  mutate(time = hms(hour = hour, minute = minute)) %>% View()


## Pacote lubridate
class(ymd("2023/10/02"))

ymd("2023/10/02")
ymd("2023-10-02")
ymd("2023   10   02")
ymd("23   10   02")

mdy("10 02 2023")
mdy("Oct 02, 2023 ")
mdy("October, 2th      2023 ")

ymd_h("2023/10/02,15")

date <- ymd("2023/10/02")
year(date)
month(date)
day(date)
week(date)
wday(date, label=T, abbr=F)
yday(date)



# Exercício:
# Use the appropriate lubridate function to parse each of the following dates:
d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014

