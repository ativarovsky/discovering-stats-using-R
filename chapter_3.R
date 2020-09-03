## Chapter 3 - Intro to R Environment

## Building a dataframe by defining variables
name = c("Ben", "Martin", "Andy", "Paul", "Graham", "Carina", "Karina", "Doug", "Mark", "Zoe")
birth_date = as.Date("03-07-1977", "24-05-1969", "21-06-1973", "16-07-1970", "10-10-1949", "05-11-1963", "08-10-1987", "16-09-1989", "20-05-1973", "12-11-1984")
job = c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2)
job = factor(job, levels = c(1:2), labels = c("Lecturer", "Student"))
levels(job)
friends = c(5, 2, 0, 4, 1, 10, 12, 15, 12, 17)
alcohol = c(10, 15, 20, 5, 30, 25, 20, 16, 17, 18)
income = c(20000, 40000, 35000, 22000, 50000, 5000, 100, 3000, 10000, 10)
neurotic = c(10, 17, 14, 13, 21, 7, 13, 9, 14, 13)
lecturer_data = data.frame(name, birth_date, job, friends, alcohol, income, neurotic)

## Select
## Now we can select certain rows and columns we want into a new dataframe. The format is
## new_df = old_df[rows, columns]. If you want all rows, just don't put anything before
## the comma. 
lecturer_personality = lecturer_data[, c("friends", "alcohol", "neurotic")]

## You can also use logical operators to filter: 
lecturer_only = lecturer_data[job == "Lecturer",]

## And you can do both: 
alcohol_personality = lecturer_data[alcohol > 10, c("friends", "alcohol", "neurotic")]

## You can also use subset: 
## new_df = subset(old_df, filters, select = c("x", "y", "z"))
alcohol_personality_2 = subset(lecturer_data)


## Dataframes vs matrices
## Certain functions only work on matrices. In this case, use new_df = as.matrix(old_df)

## 3.9.4: Wide to long format (see good figure on pag 107)
## You can use the stack() and unstack() functions for simple operations, or the cast()
## and melt() functions in the reshape package in base R (or just use pivot_longer and 
## pivot_wider)








