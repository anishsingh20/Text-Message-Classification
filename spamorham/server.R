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


#shiny server function
shinyServer(function(input, output) {
  
  #take an action whenever a button is pressed
  
  #print the entered message to console each time the submit button is pressed to check
  observeEvent(input$btn, {
    cat("\nEntered Text:", input$message,"\n")
  })
 
  
  class<-eventReactive(input$btn,{
           
            msg=corpus(input$message)
            ms.dfm<-dfm(msg,tolower=TRUE,stem=TRUE)
            ms.dfm=dfm_select(ms.dfm,msg.dfm.train)
            #predicting on the entered text by user
            class=predict(nb.classifier,newdata=ms.dfm)
            #printing the class label
            toupper(class$nb.predicted)
            
    
  })    
  
  output$label <-renderText({
    
    class() 
  #calling the event function class() from above to print spam or ham after hitting submit button
  
  })
  
  
  
  
   
  
  
})
