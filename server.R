server <- function(input, output) {
  participants <- c("Elizaveta", "Anna-Mariya", "Monika", "Thoin",
                    "Enkhee","Elena","Ben","Amit","Aditya")
  # Function to generate a matrix
  ss<-function(participants){
   # participants <- c("Elizaveta", "Anna-Mariya", "Monika", "Thoin",
           #          "Enkhee","Ben","Amit","Aditya")

    if(length(participants)%%2!=0){
      participants<-c("Aditya_2",participants)
    }
    
    mat<- cbind(participants,rep(NA,length(participants)))
    colnames(mat)<-c("Sender", "Receiver")
    
    repeat{
      Status <- "No"
      gen_receiver <- sample(participants,size=length(participants),
                             replace=FALSE)
      mat[1:length(participants),2]<-gen_receiver
      for (iter in 1:dim(mat)[1]){
        print(iter)
        if(mat[iter,1]==mat[iter,2]){
          Status <- "Restart"
        }
        if(mat[iter,1] %in% c("Ben", "Aditya") & mat[iter,2] %in% c("Ben", "Aditya","Amit","Enkhee")) {
          Status <- "Restart"
        }
        if(mat[iter,1] =="Aditya" & mat[iter,2]=="Aditya_2"){
          Status <- "Restart"
        }
           
      }
      if (Status != "Restart")
        break
      
    }
    
    
    return(mat)
  }
  
  
  
  # Event observer for button click
  observeEvent(input$generate_matrix_btn, {
    matrix_data <- ss(participants)
    output$display_matrix <- renderTable({
      matrix_data
    })
  }  
  )
  
  
  # Event observe for submit button
  
}



# Run the application
