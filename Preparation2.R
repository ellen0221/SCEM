# Data Wrangling

# install.packages("tidyverse")
#library(tidyverse)
#install.packages("palmerpenguins")
#library(palmerpenguins)
#head(penguins)

# select() 
# select a subset of columns and generate a new dataset
penguinsV2 <- select(penguins, species, bill_length_mm, body_mass_g, flipper_length_mm)
print(penguinsV2)
# remove columns
penguinsV3 <- select(penguinsV2, -flipper_length_mm)
print(penguinsV3)

# filter()
# filter rows: extracting a subset of rows
filter(penguinsV2, species=='Gentoo')
# multiple conditions
filter(penguinsV2, species=='Gentoo' & body_mass_g>5000)
# combie filter and select functions
gentooPenguins <- select(filter(penguinsV2, species=='Gentoo'), species, bill_length_mm, body_mass_g, flipper_length_mm)
print(gentooPenguins)

# simplify codes with the pipe operator
# %>% allows arguments to be implicitly passed as objects to the function after the pipe
penguinsPipe <- penguinsV2 %>% filter(species=='Gentoo') %>% select(species, bill_length_mm, body_mass_g, flipper_length_mm)
print(penguinsPipe)
# %>% in function
# x %>% f1(a) %>% f2(b) %>% f3(c) equals f3(f2(f1(x, a), b), c)

# mutate()
# create a new column
penguinsV2 %>% mutate(flipper_bill_rate=flipper_length_mm/bill_length_mm)

# rename()
# rename an existing column
penguinsV2 %>% rename(f_l_m = flipper_length_mm)

# sorting the rows
# arrange() from low to high
penguinsV2 %>% arrange(bill_length_mm)
# desc()
penguinsV2 %>% arrange(desc(bill_length_mm))

# summarizing data
# summarize(): summarizing a data frame into just one value or a vector
penguinsV2 %>% summarize(num_rows=n(), avg_weight_kg=mean(body_mass_g/1000, na.rm=TRUE), avg_flipper_bill_ratio=mean(flipper_length_mm/bill_length_mm, , na.rm=TRUE))

# group_by()
penguinsV2 %>% group_by(species)
# group and then summarize
penguinsV2 %>% group_by(species) %>% summarize(num_rows=n(), avg_weight_kg=mean(body_mass_g/1000, na.rm=TRUE), avg_flipper_bill_ratio=mean(flipper_length_mm/bill_length_mm, , na.rm=TRUE))

# across()
# perform column-wise operations (for all columns), without copying and pasting the same code
# compute the number of NA values in each column
Num_NAs <- penguinsV2 %>% summarize(across(everything(), ~sum(is.na(.x))))
print(Num_NAs)
# ~sum(is.na(.x)) equals to function(x) {sum(is.na(x))}

# where()
# combine across and where
penguinsV2 %>% summarize(across(where(is.numeric), ~mean(.x, na.rm=TRUE)))

# combination of functions above
penguinsV2 %>% 
    select(-bill_length_mm) %>% 
    group_by(species) %>% 
    summarize(across(where(is.numeric), ~mean(.x, na.rm=TRUE)))

# combining multiple data frames
# inner_join()
# an inner join means only rows with matching keys in both x and y are included in the result
# full_join()
# an outer join (full join) means to include all rows in x with matching columns in y, then the rows of y that don't match x
# left_join()
# a left join means to include all rows in x, and add matching columns from y
# right_join()
# a right join means to include all rows in y, and add matching columns from x


# Tidy Data and Iteration

# pivot_wider(): reshape data frame into a wide format

# pivot_longer(): reshape data from the wide format to the narrow format

# seperate(): seperate a column with multiple variables by seperate character into n columns
# the optional parameter called convert can convert columns into numeric types

# unite(): paste together multiple columns into one, combining columns with seperate character

# nest(): pack the data of each individual group into a table(data frame)
# to use nest() we need to first group the data frame

# unnest(): flatten the tables back into regular columns


# iteration based on map function
# map()
# map_lgl()
# map_int()
# map_dbl()
# map_chr()

# cor(): compute the correlation between two vectors

?unlist
?abs

# deal with missing data
# complete(): take a set of columns and find all unique combinations.
# complete.cases(): return a logical vector indicating which cases are complete(NA is not complete)
# filter(): remove the incomplete cases


# Data visualisation with R

# ggplot2







