library(ggplot2)
library(tidyverse)

## Explore ggplot using the facebook narcissism data file
facebook_data = read.delim("FacebookNarcissism.dat", header = TRUE)
graph = ggplot(facebook_data, aes(NPQC_R_Total, Rating, colour = Rating_Type)) 
graph + geom_point()
graph + geom_point(aes(shape = Rating_Type), position = "jitter")

# self test 4.5:
graph + geom_smooth()
graph + geom_point() + geom_smooth()
graph + geom_point() + geom_smooth() + labs(x = "Narcissism Score", 
                                            y = "Photo Rating")

## 4.5 Scatterplot
exam_data = read.delim("Exam Anxiety.dat", header = TRUE)
scatter = ggplot(exam_data, aes(Anxiety, Exam, colour = Gender))
scatter + geom_point() + labs(x = "Exam Anxiety", y = "Exam Performance") + 
  geom_smooth(aes(fill = Gender), alpha = 0.1)


## 4.6: Histogram
festival_data = read.delim("DownloadFestival.dat", header = TRUE)
festival_histogram = ggplot(festival_data, aes(x = day1))
festival_histogram + geom_histogram(binwidth = 0.5)

## 4.6: Boxplots
festival_boxplot = ggplot(festival_data, aes(gender, day1))
festival_boxplot + geom_boxplot()
# now we remove the outlier: 
festival_data = festival_data[order(festival_data$day1, decreasing = TRUE),]
# outlier belongs to ticket 4158, let's remove it: 
festival_data_1 = festival_data[festival_data$day1 < 20, ]

## 4.7 Density Plots (smoothed out histograms)
density = ggplot(festival_data_1, aes(day1))
density + geom_density()


## 4.9 Graphing means
### Bar charts
chick_flick = read.delim("ChickFlick.dat", header = TRUE)
# mean arousal score for each film:
bar = ggplot(chick_flick, aes(film, arousal, fill = film))
bar + stat_summary(fun = mean, geom = "bar", position = "dodge") + 
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar") + 
  facet_wrap(~ gender)


### Line graphs
hiccups_data = read.delim("Hiccups.dat", header = TRUE)
# pivot:
hiccups_data %>% pivot_longer(c("Baseline":"Rectum"), names_to = "timepoint", values_to = "hiccups")
# or baseR: 
hiccups = stack(hiccups_data)
names(hiccups) = c("Hiccups", "Intervention")
hiccups$Intervention_factor = factor(hiccups$Intervention)
# line graph: 
line = ggplot(hiccups, aes(Intervention_factor, Hiccups))
line + stat_summary(fun = mean, geom = "point") + 
  stat_summary(fun = mean, geom = "line", aes(group = 1), color = "Blue", linetype = "dashed") +
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2)


### Line graphs for several independent variables
text_data = read.delim("TextMessages.dat", header = TRUE)
text_messages = text_data %>% pivot_longer(c("Baseline", "Six_months"), names_to = "Timepoint")
text_messages$Timepoint = as.factor(text_messages$Timepoint)
# now plot: 
line = ggplot(text_messages, aes(Timepoint, value, group = Group))
line + stat_summary(fun = mean, geom = "point") + 
  stat_summary(fun = mean, geom = "line", aes(colour = Group)) + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", aes(colour = Group), width = 0.2) +
  labs(x = "Time", y = "Mean Grammar Score") +
  ylim(0, 70)

