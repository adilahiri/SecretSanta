ui <- fluidPage(
  titlePanel("Secret Santa"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("generate_matrix_btn", "Generate Random Pairs"),
      #textInput("textInput", "Add Participants:"),
      #actionButton("submitButton", "Submit Participants"),
      img(src="myImage.jpeg",height=200, width=200)
    ),
    mainPanel(
      tableOutput("display_matrix")
    )
  )
)
