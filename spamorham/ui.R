library(shiny)
require(shinythemes)
library(markdown)

# Define UI for application that draws a histogram


navbarPage("Text Classification",
        tabPanel("Spam or Ham using Naive Bayes Classifier",
           
        fluidPage(
             
          theme = shinytheme("cosmo") ,
           
            sidebarLayout(
              sidebarPanel(
                textInput("message",label="Enter the message",placeholder="enter text here"),
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
        
      )#end fluidPage2
      
    )#end tab2-Details
    
    
    
  )#close navbar

                   
  
           
  
      
