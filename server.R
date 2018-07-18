function(input, output, session) {

  model <- eventReactive(input$gobutton, {

    mysalt <- sample(-input$salt_adjust:input$salt_adjust, 1)
    mySaltedDate <- input$date2 - input$date + mysalt
    
    if(mySaltedDate < 0){
      saltYears = "NA"
      saltMonths = "NA"
      saltDays = "NA"
    }
    else{
    
    saltYears = as.numeric(mySaltedDate) %/% 365.25
    saltMonths = (as.numeric(mySaltedDate) - saltYears*365.25) %/% 30.5
    saltDays = floor(as.numeric(mySaltedDate) - saltYears*365.25 - saltMonths*30.5)
    }
    
    list(mySaltedDate=mySaltedDate, 
         saltYears = saltYears, 
         saltMonths = saltMonths, 
         saltDays = saltDays)
  })
  
  

  output$saltedAge <- renderText({
    paste("<h2>Salted age is", as.character(model()$mySaltedDate), "days old</h2>")
  })
  
  output$saltedYMD <- renderText({
    paste("<h4>", as.character(model()$saltYears), "years,",
          as.character(model()$saltMonths), "months, &",
          as.character(model()$saltDays), "days</h4>")
  })

}