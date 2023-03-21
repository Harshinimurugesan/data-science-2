#importing nlp based library
library(udpipe) #for data prep in nlp 

#importing dataset
data(brussels_listings,packages='udpipe')

#viewing dataset
View(brussels_listings)

#segregating  a column
x<-table(brussels_listings$neighbourhood)
View(x)

#sorting
x<-sort(x)
View(x)

#importing text visualization library
library(textplot)

#word frequency bar chart
textplot_bar(x,panel="locations",col.panel="darkgrey",xlab="listings",
             cextext=0.75,addpct=TRUE,cexpct=0.5)

#importing dataset
data(brussels_reviews_anno,packages='udpipe')
View(brussels_reviews_anno)

#segregating data
y<-subset(brussels_reviews_anno,xpos%in%"NN"&language%in%"nl"&!is.na(lemma))
View(y)

#document term frequencies
y<-document_term_frequencies(y,document="doc_id",term="lemma")
View(y)

#document term matrix
dtm<-document_term_matrix(y)
dtm

#removing low frequency words
dtm<-dtm_remove_lowfreq(dtm,maxterms=60)
dtm

#correlation matrix
cor<-dtm_cor(dtm)
View(cor)

#importing libraries
library(glasso)#for graphical lasso

#word correlation plot
#textplot_correlation_glasso(cor,exclude_zero=TRUE)

#word co ocurrence graph
#segregating data
w<-subset(brussels_reviews_anno,xpos%in%"JJ"&language%in%"fr")
View(w)

#co occuring terms
w<-cooccurrence(w,group="doc_id",term="lemma")
View(w)

#cooccurence plot
textplot_cooccurrence(w,top_n=25,subtitle="showing only top 25")

#dependency parshing
#creating data
sentence="hey friends,welcome to the class.lets learn about text analytics"

#tokenize and pos tag for each word in data
z<-udpipe(sentence,"english")
View(z)

#importing relational data visualistion library
library(ggraph)

#dependency parser plot
textplot_dependencyparser(z)
