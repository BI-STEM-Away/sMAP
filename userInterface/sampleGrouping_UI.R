sampleGroupingTab <- tabItem(tabName = "sampleGrouping",
                             fluidRow(
                               column(2,
                                      div(style = "display:inline-block; float:left", 
                                          actionButton('backTo_potentialOutliers', label = 'Back', status = "success"))
                               ),
                               
                               column(8, align="center",
                                      tags$h5("Group Samples to Analyze DEGs")
                                      
                               ),
                               
                               # @roman_ramirez
                               column(2,
                                      div(style = "display:inline-block; float:right", 
                                          actionButton('to_topDEGs', label = 'Next', status = "success"))
                               )
                             ),
                             HTML("<HR>"),
                             HTML("<BR>"),
                             fluidRow(
                               
                               column(6, offset=3,align="center",
                                      htmlOutput("col_selection"),
                                      HTML("<style> #col_selection {position: relative; top: 100px} </style>"),
                                      
                               )
                               
                             )
)
