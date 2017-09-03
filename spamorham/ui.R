library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Text Classification-Spam or Ham"),
  
  # Sidebar with a slider input for number of bins 
    sidebarPanel(
        
        textInput("message",label = "Enter the Message",value="",placeholder="Enter the message"
          
          
        )
  ),

    mainPanel(
        verbatimTextOutput("msg")
     )
  
))
  
  
      
