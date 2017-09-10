library(shiny)
require(shinythemes)
library(markdown)

# Define UI for application that draws a histogram


navbarPage("Text Classification App",
        tabPanel("Spam or Ham using Naive Bayes Classifier",
                 
           
        fluidPage(
             
          shinythemes::themeSelector() ,
           
            fluidRow(
              column(12,offset=4,
              #sidebarPanel(style="display:block;width:80%",class="col-sm-12",
                div(class="col-sm-12",
                textAreaInput("message",
                label="Enter a message having words more than 2",
                placeholder="enter text message here"),
                p("Eg-Hey,there how are you,let's meet up!?"),
                br(),
                actionButton("btn","submit")
                     )#end div  
                
                   ),#end column
                
                br(),
              
                column(6,offset=4,style="margin-top:20px",
                      h4("P.S:The main purpose of making this application was to
                        learn to develop a Shiny app in R embedded with some predictive analytics i.e applying NLP to classify unstructured text data.") 
                       
                       )
            #)
                 ), #end row
            
          hr(),
          
           mainPanel(
            
             fluidRow(
             
             column(12,offset=6,
             h2("The entered message is a:", strong((textOutput("label")))),
             br(),
             p("Accuracy of prediction on test set is 98.06%")
             ),
             
            
             
             
             column(12,offset=6,
                    a(strong("Github link to repository-Text message Classification"),href="https://github.com/anishsingh20/Spam-or-Ham"),
                    br(),
                   
                    tags$ol("For any queries reach out to me on:",
                            tags$li(tags$a("LinkedIn",target="_blank",href="https://www.linkedin.com/in/anish-singh-walia-924529103/")),
                            tags$li(tags$a("Github",target="_blank",href="https://github.com/anishsingh20")),
                            tags$li(tags$a("Twitter",target="_blank",href="https://twitter.com/anish_walia"))
                            
                   
                    
                    )#end ul
                    )#end col2
             
              ), #end row
           
             
             
            column(12,offset=6,
                   h4("Made with love from-",strong("Anish Singh Walia"))) 
             
             
          )#end 
          
          
           
      )#close fluidPage
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
                 
                 
                 img(src='ham-wordcloud.png',style="margin:auto")
                   
                  )
          ),#end fluidrow
  
        
        hr(),
        
        fluidRow(
          column(12,class="col-sm-12",
                 h3("Spam wordcloud",align="center"),
                 img(src='Spam-wordcloud.png',style="margin:auto")
                 )
          
        )#end fluidrow 2
        
        
      )#end fluidPage2
      
    )#end tab2-Details
    
    
     
    
  )#close navbar

           
  
      
