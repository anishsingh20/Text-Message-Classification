library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Text Classification-Spam or Ham"),
  
  # Sidebar with a slider input for number of bins 
    sidebarPanel(
        
        
        textAreaInput("message",label = "Enter the Message",value="",width="80%",
                      placeholder="Enter the message"
          
          
        ),
        
        actionButton("submit",value="Submit",label="Submit",width="100px",
                     style="background:#A137F3;border:0px;color:white")
  ),

    mainPanel(
        
        textOutput("label")
    )                
))
  
  
      
