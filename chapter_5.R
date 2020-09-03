library(tidyverse)

# 5.5 ASSUMPTION OF NORMALITY

# first we need to fix the outlier from the Download festival dataset
festival_data = read.delim("DownloadFestival.dat", header = TRUE)

festival_data$day1 = replace(festival_data$day1, festival_data$day1 == 20.02, 2.02)

## plotting histograms for each of the three days of the festival
hist_day1 = 
  festival_data %>% 
  ggplot(aes(day1)) + geom_histogram(aes(y = ..density..)) + 
  labs(x = "Hygiene score on day 1", y = "Density")

## Adding a normal to day1 curve using stat_function
hist_day1 + stat_function(fun = dnorm, 
                          args = list(mean = mean(festival_data$day1, na.rm = TRUE), 
                                      sd = sd(festival_data$day1, na.rm = TRUE)))

## Day 2
hist_day2 = 
  festival_data %>% 
  ggplot(aes(day2)) + geom_histogram(aes(y = ..density..)) + 
  labs(x = "Hygiene score on day 2", y = "Density") +
  stat_function(fun = dnorm, 
                args = list(mean = mean(festival_data$day2, na.rm = TRUE), 
                            sd = sd(festival_data$day2, na.rm = TRUE)))

## Day 3
hist_day3 = 
  festival_data %>% 
  ggplot(aes(day3)) + geom_histogram(aes(y = ..density..)) + 
  labs(x = "Hygiene score on day 3", y = "Density") +
  stat_function(fun = dnorm, 
                args = list(mean = mean(festival_data$day3, na.rm = TRUE), 
                            sd = sd(festival_data$day3, na.rm = TRUE)))

## Q-Q plot
qqplot_day1 = qplot(sample = festival_data$day1)

# Quantifying Normality with numbers
## We can use either describe() in psych package or stat.desc() in pastecs 
## package to find mean, median, skew, kurtosis, etc
psych::describe(festival_data$day1)

## MOVED TO RMARKDOWN

  