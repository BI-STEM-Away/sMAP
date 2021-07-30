#roman_ramirez
# Imported @ivanlam27's introduction code
introductionTab <- tabItem(tabName = "introduction",
                            fluidRow(
                                column(12,
                                       align="center",
                                       #Introduction block 
                                       jumbotron(
                                          status = "success",btnName = NULL,
                                          title = HTML("<b>sMAP: Standard Microarray Analysis Pipeline</b>"),
                                          lead = "An application for processing quality control, statistical and functional analysis of a 
                                          GEO dataset in order to find potential biomarkers.",
                                          "This app is created by STEM-Away RShiny Project Team - Session 1, 2021",
                                          href = "https://stemaway.com/" 
                                       ),
                                       # @roman_ramirez
                                       div(style ="display:inline-block", 
                                           actionButton('to_dataImport', label = 'Begin', status = "success"))
                                )
                            )

                           
)
