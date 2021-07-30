contactTab <- tabItem(tabName = "contact",
                    fluidRow(
                        column(12,
                               HTML("How can we help?"),
                               #margin space
                               tags$p("                   "),
                        ), 
                        
                        
                        fluidRow(
                        
                          column(width=3,
                                 textInput("First name", "First name")),
                          
                          column(width=3,
                                 textInput("Last name", "Last name")),
                          
                          column(11,
                                 textInput("Email", "Email")),
                          column(12,
                                 
                                 textInput("Message", "Message")),
                          
                          actionButton('Submit', 'Submit')
                        
                         
                      )
                      
)
)