ui <- fluidPage(
  titlePanel("Secret Santa"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("textInput", "Enter Magic Number:"),
      actionButton("submitButton", "Submit Number and Generate Pairs"),
      #actionButton("generate_matrix_btn", "Generate Random Pairs"),
      img(src="myImage.jpeg",height=200, width=200),
      verbatimTextOutput("outputText")
      
    ),
    mainPanel(
      tableOutput("display_matrix")
    )
  )
)

#rsconnect::deployApp('/Users/aditya/Desktop/SecretSanta')
