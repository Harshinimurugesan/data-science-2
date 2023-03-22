require(readtext)
data_mobydick<-texts(readtext("http://www.gutenberg.org/cache/epub/2701/pg2701.txt"))
data_mobydick

names(data_mobydick)<-"Moby Dick"

textplot_xray(
  kwic(tokens(data_mobydick),pattern="whale"),
  kwic(tokens(data_mobydick),pattern="ahab"))
library(quanteda.textmodels)

data(data_corpus_irishbudget2010,package="quanteda.textplots")

dt_dfm<-(tokens(data_corpus_irishbudget2010))

dt_dfm

refscores<-c(rep(NA,4),1,-1,rep(NA,8))
refscores

ws<-textmodel_wordscores(dt_dfm,y=refscores,smooth=1)
ws

textplot_scale1d(ws,highlighted=c("minister","have","our","budget"),highlighted_color="red")
pred<-predict(ws,se.fit=TRUE)
pred

textplot_scale1d(pred,margin="documents",
                 groups=docvars(data_corpus_irishbudget2010,"party"))
pred_lbg<-predict(ws,se.fit=TRUE,rescaling="lbg")
pred_lbg

textplot_scale1d(pred_lbg,margin="documents",
                 groups=docvars(data_corpus_irishbudget2010,"party"))

wf<-textmodel_wordfish(dfm(tokens(data_corpus_irishbudget2010)),dir=c(6,5))
wf

textplot_scale1d(wf,margin="features",
                 highlighted=c("government","global","children",
                               "bank","economy","the","citizenship",
                               "productivity","deficit"),
                 highlighted_color="red")

textplot_scale1d(wf,groups=data_corpus_irishbudget2010$party)

ca<-textmodel_ca(dt_dfm)
ca

summary(ca)

textplot_scale1d(ca,margin="documents",
                 groups=docvars(data_corpus_irishbudget2010,"party"))
