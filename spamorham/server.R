#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quanteda)


#R-code for the 
spam<-read.csv("F:/PROJECTS/Datasets/spam.csv",header=TRUE, sep=",", quote='\"\"', stringsAsFactors=FALSE)
set.seed(2012)
spam<-spam[sample(nrow(spam)),]

names(spam)<-c("type","message")

#to search more on this method
msg.corpus<-corpus(spam$message)
docvars(msg.corpus)<-spam$type   #ataching the label to the corpus message text
spam.train<-spam[1:4458,]


msg.dfm <- dfm(msg.corpus, tolower = TRUE)  #generating document freq matrix
msg.dfm <- dfm_trim(msg.dfm, min_count = 5, min_docfreq = 3)  
msg.dfm <- dfm_weight(msg.dfm, type = "tfidf") 

#trining and testing data of dfm 
msg.dfm.train<-msg.dfm[1:4458,]

#training the naive-bayes classifier
nb.classifier<-textmodel_NB(msg.dfm.train,spam.train[,1])



shinyServer(function(input, output) {
  
 
  
 
  
  
  output$label <-renderText({
    msg=corpus(input$message)
    ms.dfm<-dfm(msg,tolower=TRUE,stem=TRUE, remove=stopwords("english"))
    ms.dfm=dfm_select(ms.dfm,msg.dfm.train)
    #predicting on the entered text by user
    class=predict(nb.classifier,newdata=ms.dfm)
    class$nb.predicted
    
  
  })
  
  
  
  
   
  
  
})
