#PSYC 259 Homework 2 - Data Transformation
#For full credit, provide answers for at least 7/10

#List names of students collaborating with: 
#Samyukta Jayakumar

### SETUP: RUN THIS BEFORE STARTING ----------

#Load packages
library(tidyverse)
ds <- read_csv("data_raw/rolling_stone_500.csv")
View(ds)
  
### Question 1 ---------- 

#Use glimpse to check the type of "Year". 
#Then, convert it to a numeric, saving it back to 'ds'
#Use typeof to check that your conversion succeeded

#ANSWER
ds_Year <- glimpse(select(ds, c ("Year")))
ds$Year<- as.numeric(ds$Year)
typeof(ds$Year)



### Question 2 ---------- 

# Using a dplyr function,
# change ds so that all of the variables are lowercase

#ANSWER
ds_LowercaseSong <- tolower(ds$Song)
ds_LowercaseArtist <- tolower (ds$Artist)
ds <- mutate(ds, Song = ds_LowercaseSong, Artist= ds_LowercaseArtist)
View(ds)

### Question 3 ----------

# Use mutate to create a new variable in ds that has the decade of the year as a number
# For example, 1971 would become 1970, 2001 would become 2000
# Hint: read the documentation for ?floor

#ANSWER
?floor
ds$YearNew <- ds$Year
ds <- ds %>% mutate(YearNew = floor(Year/10)*10)
View(ds)

### Question 4 ----------

# Sort the dataset by rank so that 1 is at the top

#ANSWER
ds$Rank
ds <-  ds%>% arrange(Rank)
View(ds)

### Question 5 ----------

# Use filter and select to create a new tibble called 'top10'
# That just has the artists and songs for the top 10 songs

#ANSWER
top10 <- filter(ds, Rank < 11)



### Question 6 ----------

# Use summarize to find the earliest, most recent, and average release year
# of all songs on the full list. Save it to a new tibble called "ds_sum"

#ANSWER
ds_sum <- ds %>% summarize(earliest_year = min(Year, na.rm = T), average_year = mean(Year,na.rm = T),
                           mostrecent_year = max(Year, na.rm = T))

### Question 7 ----------

# Use filter to find out the artists/song titles for the earliest, most 
# recent, and average-ist years in the data set (the values obtained in Q6). 
# Use one filter command only, and sort the responses by year

#ANSWER
ds_filter <- filter(ds, Year == ds_sum$earliest_year |  Year == round (ds_sum$average_year)  | Year == ds_sum$mostrecent_year)
ds_filter <- ds_filter %>% arrange(Year)

### Question 8 ---------- 

# There's and error here. The oldest song "Brass in Pocket"
# is from 1979! Use mutate and ifelse to fix the error, 
# recalculate decade, and then
# recalculate the responses from Questions 6-7 to
# find the correct oldest, averag-ist, and most recent songs

#ANSWER
?ifelse
ds <- ds %>% mutate(Year = ifelse(Song == "brass in pocket", 1979, Year))
ds$YearNew <- ds$Year
ds <- ds %>% mutate(YearNew = floor(Year/10)*10)
ds_sum <- ds %>% summarize(earliest_year = min(Year, na.rm = T), average_year = mean(Year,na.rm = T),
                           mostrecent_year = max(Year, na.rm = T))
ds_filter <- filter(ds, Year == ds_sum$earliest_year |  Year == round (ds_sum$average_year)  | Year == ds_sum$mostrecent_year)
ds_filter <- ds_filter %>% arrange(Year)

### Question 9 ---------

# Use group_by and summarize to find the average rank and 
# number of songs on the list by decade. To make things easier
# filter out the NA values from decade before summarizing
# You don't need to save the results anywhere
# Use the pipe %>% to string the commands together

#ANSWER


### Question 10 --------

# Look up the dplyr "count" function
# Use it to count up the number of songs by decade
# Then use slice_max() to pull the row with the most songs
# Use the pipe %>% to string the commands together

#ANSWER

  