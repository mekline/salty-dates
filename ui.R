fluidPage(
  titlePanel(title=div(img(src="dates.png",height = 72, width = 72), 
                       "Salty-Dates")),
  
  sidebarLayout(
    sidebarPanel(
      dateInput('date',
                label = "Participant's birthdate",
                value = Sys.Date()
      ),
      dateInput('date2',
                label = "Test date",
                value = Sys.Date()
      ),
      sliderInput("salt_adjust", 
                label = "Random number range:",
                min = 0, max = 30, value = 3, step = 1),
      
      
      helpText("(A value of 3 means that a random integer uniformly drawn from [-3, 3] 
               will be added to the participant's true age)"),
      
      actionButton("gobutton", "Get some salty dates!")
    ),
    
    mainPanel(
      
      htmlOutput("saltedAge"),
      htmlOutput("saltedYMD"),
      
      p("If you record both the (true) exact age of a participant and the date on which 
        you tested them, their birthday can be calculated! This is especially relevant for
        developmental psychology, where age is usually a key variable for analysis. 
        Salty-Dates adds salt (random noise) to this value to help anonymize your datasets."),
      p("Because it's actually pretty difficult to avoid encoding information 
             about when a piece of data was collected (it may be reflected in the 'date 
             created' metadata of a file, for instance), avoiding (true) exact ages 
             is a safer way to avoid re-identifying participants."),
      p("Depending on your IRB and jurisdiction, so long as your data does not 
            contain any of the ", a(href="", "18 Safe Harbor Identifiers"), "(which includes
            a participant's birthday), it is fine to share a dataset openly because it does
            not contain any *personally identifying information*. In other words, the 
            data have been", a(href="", "de-identified"),".")

  )
  )
)