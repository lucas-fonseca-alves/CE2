##############################################
####### Aula CE2 - Prof. Thais #######
##############################################

library(tidyverse)
library(nycflights13)
library(lubridate)
str(nycflights13::flights)

## Exemplo do slide
flights %>%
  mutate(weekday = wday(time_hour, label = TRUE, abbr = FALSE)) %>%
  group_by(weekday) %>%
  filter(!is.na(arr_delay)) %>%
  summarise(avg_delay = mean(arr_delay))


## Opção alternativa: Função make_date
View(flights)
flights2 <- flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))
View(flights2)


## Rounding dates
today()
now()
floor_date(flights$time_hour, "week") %>% head()
round_date
ceiling_date

x <- now()
Sys.timezone()

head(OlsonNames())
length(OlsonNames())
x
round_date(x, "second")
ceiling_date(x, "second")
floor_date(x, "second")

round_date(x, "hour")
floor_date(x, "hour")

round_date(x, "month")
floor_date(x, "month")
ceiling_date(x, "month")


flights2 %>% 
  count(week = floor_date(departure, "week")) %>% 
  ggplot(aes(week, n)) +
  geom_line()


## Calculating Periods
?period
wday(today() + 15, label=T)

today() + 15 # não adequado
now() + 15 # não adequado
today() + days(60)
now() + days(15)
now() + hours(8)
now() + hours(100)
now() + days(1500)

am(now())
pm(now())

##  Plot average departure delay by minute within the hour
make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))


flights_dt %>% 
  filter(arr_time < dep_time)


flights_dt <- flights_dt %>% 
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  )
view(flights_dt)

