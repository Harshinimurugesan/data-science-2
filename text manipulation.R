#importing libraries
library(robotstxt)
library(rvest)

#scrapping website
url <- "https://www.espncricinfo.com/story/anantha-narayanan-jayasuriya-stunner-in-singapore-and-all-the-other-outliers-in-odi-history-1348299"
#allowability
path = paths_allowed(url)

#html of the website
web = read_html(url)
View(web)

#segregate content 
content <- web %>% html_nodes(".ci-html-content div") %>% html_text()
View(content)

#lowercase conversion
lowc = tolower(content)
View(lowc)

#uppercase conversion
highc = toupper(content)
View(highc)

#character replacement
chartr(old = "a", new = "A",lowc)

#splitting strings
spl = strsplit(highc, split = " ")
View(spl)

#extract as list
spl[[1]]

#extract as words
spl2 = unlist(strsplit(highc,split = " "))
View(spl2)

#accessing single element
spl2
spl2[3]
spl2[7]

#importing library
library(stringr)

#length of the string
str_length(content)
str_length(spl)
str_length(spl2)

#detecting string
str_detect(spl2, "B")
str_detect(spl2,"AT")

#detecting string indexes
str_which(spl2,"AT")
spl2[2855]

#counting matches in string 
str_count(spl2,"A")

#flattening strings
a = str_flatten(spl,"")
View(a)

#converting to title format
str_to_title(lowc[1])

#converting to sentences
str_to_sentence(lowc[1])

