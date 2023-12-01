server <- function(input, output) {
  participants <- c("Elizaveta", "Anna-Mariya", "Monika", "Thoin",
                    "Enkhee","Elena","Ben","Amit","Aditya")
  # Function to generate a matrix
  ss<-function(participants,min_run_time=NULL){
   # participants <- c("Elizaveta", "Anna-Mariya", "Monika", "Thoin",
           #          "Enkhee","Ben","Amit","Aditya")
    
    if(is.null(min_run_time) || min_run_time=="" ||min_run_time==" "){
      min_run_time<-10
    }
    else{
      min_run_time<-as.numeric(min_run_time)
    }
    counter=1
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
        if(mat[iter,1] =="Aditya_2" & mat[iter,2]=="Aditya"){
          Status <- "Restart"
        }
           
      }
    
      if (Status != "Restart" & counter >= min_run_time)
        break
      counter=counter+1
      
    }
    text_counter<- paste("converged after  :" ,counter,"Runs")
    return(list(mat,text_counter))
  }
  
  
  
  # Event observer for button click
  # observeEvent(input$generate_matrix_btn, {
  #   matrix_data <- ss(participants,min_run_time= input_text()) 
  #   
  #   output$display_matrix <- renderTable({
  #     matrix_data [[1]]
  #   })
  #   
  #   output$outputText <- renderText({
  #     matrix_data [[2]]
  #   })
  #   
  # }  
  # )
  # 
  observeEvent(input$submitButton, {
    matrix_data <- ss(participants,min_run_time= input_text()) 
    
    output$display_matrix <- renderTable({
      matrix_data [[1]]
    })
    
    output$outputText <- renderText({
      matrix_data [[2]]
    })
    
  }  
  )
  
  
  
  
  
  # Event observe for submit button
  # Reactive expression to capture the text input
  input_text <- eventReactive(input$submitButton, {
    input$textInput
  })
}




# Run the application
