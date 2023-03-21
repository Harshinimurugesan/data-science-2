#installing data from github library
devtools::install_github("bradleyboehmke/harrypotter")

#importing libraries
library(tidyverse)
library(stringr)
library(tidytext)
library(harrypotter)

#for viewing raw text
View(philosophers_stone[1:2])

#tibbling
text_tb<-tibble(chapter=seq_along(philosophers_stone),text=philosophers_stone)
View(text_tb)

#applying unnest token (split to singlewords,remove puntuation&)
text_tb%>%unnest_tokens(word,text)
text_tb

#book names
titles<-c("philosopher's stone","chamber of secrets","prisoner of azkaban","goblet of fire",
         "order of phoenix","half blood prince","deathly hallows")
titles

#books list 
books<-list(philosophers_stone,chamber_of_secrets,prisoner_of_azkaban,goblet_of_fire,
            order_of_the_phoenix,half_blood_prince,deathly_hallows)
View(books)

#tibbling&unnest tokens for all books
series<-tibble()

for(i in seq_along(titles)){
  clean<-tibble(chapter=seq_along(books[[i]]),text=books[[i]])%>%
    unnest_tokens(word,text)%>%mutate(book=titles[i])%>%
      select(book,everything())
    series<-rbind(series,clean)}
View(clean)
View(series)




