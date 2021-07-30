topDEGsTab <- tabItem(tabName = "topDEGs",
                      fluidRow(
                        column(2,
                               div(style = "display:inline-block; float:left", 
                                   actionButton('backTo_volcanoPlot', label = 'Back', status = "success"))
                        ),
                        
                        column(8, align="center",
                               HTML("<h5>Differentially Expressed Genes</h5>")
                               
                        ),
                        
                        # @roman_ramirez
                        column(2,
                               div(style = "display:inline-block; float:right", 
                                   actionButton('to_volcanoPlot', label = 'Next', status = "success"))
                        )
                      ),
                      HTML("<HR>"),
                      HTML("<BR>"),
                      fluidRow(
                        column(4,
                               #Input for genes to cutoff
                               #marmomeni
                               numericInput("cutoff","What percent of genes should be filtered out?",value=0)
                        ),
                        column(2,
                               actionButton("filt_gen","Filter Out Genes"),
                               #ShreyaVora14
                               tags$div(
                                 tags$p("The percent of genes you choose will be the percent of genes that will be filtered because of the low levels of expression. Additionally any duplicates, NA,
       or Duplicate gene symbols will be removed.")
                               )
                        ),
                        column(4,
                               numericInput("p_val","Cutoff p-value:",value=0.05)
                        ),
                        column(2,
                               actionButton("degs","Find DEGs")
                        )
                      ),
                      HTML("<HR>"),
                      HTML("<BR>"),
                      fluidRow(
                        column(12,
                               dataTableOutput("toptab")
                        )
                      )
)

#### Volcano plot

volcanoPlotTab <- tabItem(tabName = "volcanoPlot",
                   fluidRow(
                       column(2,
                              div(style = "display:inline-block; float:left", 
                                  actionButton('backTo_sampleGrouping', label = 'Back', status = "success"))
                       ),
                       
                       column(8, align="center",
                              HTML("<h5>Interactive Volcano Plot for calculated DEGs</h5>")
                              
                       ),
                       
                       # @roman_ramirez
                       column(2,
                              div(style = "display:inline-block; float:right", 
                                  actionButton('to_functionalEnrichmentAnalysis', label = 'Next', status = "success"))
                       )
                   ),
                        HTML("<HR>"),
                        HTML("<BR>"),
                  fluidRow(
                        column(3,
                               #ShreyaVora14
                               p("Volcano plots are a visualization used for differential gene expression analysis. The x-axis represents log-fold change and the y-axis 
  represents p-value. "),
                               sliderInput("n", "LogFC cutoff", 0, 5,
                                           value =1, step = 0.05),
                               shinyWidgets::sliderTextInput("m", "Adjusted P-Value cutoff", 
                                                             choices=c(1e-5,1e-10,1e-15,1e-20,1e-25,1e-30,1e-35,1e-40,1e-45,1e-50),
                                                             grid=TRUE)
                        ),
                        column(9,
                               plotOutput("plot1")
                        ),
                    )
)                  

