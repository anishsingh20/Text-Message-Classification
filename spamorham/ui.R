library(shiny)
require(shinythemes)
library(markdown)

# Define UI for application that draws a histogram


navbarPage("Text Classification App",
        tabPanel("Spam or Ham using Naive Bayes Classifier",
           
        fluidPage(
             
          theme = shinytheme("cosmo") ,
           
            sidebarLayout(
              sidebarPanel(
                textInput("message",label="Enter the message having words more than 5 :",placeholder="enter text here"),
                actionButton("btn","submit")
                
                            ),
                      
           
            
           mainPanel(
            
             
             
             
             h3("The message is :", textOutput("label"))
             
           )
          
          )
           
      )#close sidebarlayout 
    ) ,
    
    
    tabPanel('Details',
             
        fluidPage(
          
          fluidRow(
            column(12,
             
               
               
               h4("The model behind uses a Naive bayes classifier which is a simple conditional probabilistic model based on
                  ",strong("Bayes Theoram"),"and which uses the ",strong("feature independence assumption."),"The model was trained on a dataset of 4458 training examples
                  which consist of labels-(spam,ham) and the message itself."), br(),
               h4("The model achieved the accuracy of 98% based on which I developed this web app which can classify random unseen user based
                  text messages as either spam or ham with around 98% accuray."),
               
               strong( a("Link to the Document on how the naive bayes classifier was trained:",target="_blank",
                        href="http://rpubs.com/anish20/TextClassification", pointer="cursor",
                        style="font-weight:none"
               ) ) 
          
          )#end column-sm-12
          
        )#end fluidrow2 
        ,
        hr(),
        
        fluidRow(
          h2("Wordclouds for Spam and Ham messages from Dataset",style="text-align:center"),
          column(12,class="col-sm-12",
                 h3("Ham wordcloud",align="center"),
                 
                 
                 img(src='ham-wordcloud.png')
                   
                  )
          ),#end fluidrow
  
        
        hr(),
        
        fluidRow(
          column(12,class="col-sm-12",
                 h3("Spam wordcloud",align="center"),
                 img(src='Spam-wordcloud.png')
                 )
          
        )#end fluidrow 2
        
        
      )#end fluidPage2
      
    )#end tab2-Details
    
    
    
  )#close navbar

                   
  
           
  
      
