library(dplyr) #foremost package for data manipulation


data("mtcars")
data("iris")

data1 <- mtcars
head(data1)
View(data1)
### since the data looks scattered, pls rearrange using data frame and declare a new variable
mtcarzz <- data.frame(mtcars)
print(mtcarzz)

mtcarsdata <- tbl_df(data1)
#using the Filter function in dplyr to filter data with required
filter(mtcarsdata, cyl>4 & gear>5)
filter(mtcars, cyl>4 & gear>4)



#next Example
irisdata <-tbl_df(iris)

Library(dplyr)
filter(mtcarsdata, cyl>4 & gear>4)
filter(mtcarsdata, cyl>4)
View(irisdata)

#seperate the setosa and the virginica Species on the iris data
filter(irisdata, Species %in% c('setosa', 'virginica'))

#Using select function to pick columns by name
select(mtcarsdata, cyl, mpg, hp)

# to use the remaining columns apart from the above columns (just  use (-) for specific columns)
select(mtcarsdata, -cyl, -mpg, -hp)

## to hide a range of column
select(mtcarsdata, -c(cyl,mpg))

## c(used to concatenate)
#Selecting a series of columns
select(mtcarsdata, cyl:gear)

#Chaining some column to perform multiple operation (merge)
mtcarsdata %>%
  select(cyl,wt,gear)%>% #indentation(double spacing)
  filter(wt > 2)

#Using arrange and select function to reorder rows in ascending order
mtcarsdata %>%
  select(cyl,wt,gear)%>%
  arrange(wt) #ascending order

#Using arrange and select function to reorder in descending order
mtcarsdata %>%
  select(cyl,wt,gear)%>%
  arrange(desc(wt))

#Creating new variable using teh mutate function
mtcarsdata%>%
  select(mpg, cyl)%>%
  mutate(multipli = mpg*cyl)

#Using the summarize function to generate insights from the data
irisdata%>%
  group_by(Species)%>%
  summarise(Average = mean(Sepal.Length, na.rm = TRUE))
# (na.rm = TRUE) imples that R all empty values should be disregarded

#Using the rename function to rename variable
mtcarsdata %>% rename(miles =mpg)

#for multiple rename try 
mtcarsdata%>% rename(mole = cyl, san = wt)
View(mtcarsdata)
