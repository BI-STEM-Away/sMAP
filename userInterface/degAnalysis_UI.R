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
                        column(6,
                               #Input for genes to cutoff
                               #marmomeni
                               numericInput("cutoff","What percent of genes should be filtered out?",value=0),
                               actionButton("filt_gen","Filter Out Genes"),
                                #ShreyaVora14
                               HTML("<BR>"),
                               tags$div(
                                 tags$p("The percent of genes you choose will be the percent of genes that will be filtered because of the low levels of expression. Additionally any duplicates or NA gene symbols will be removed.")
                               )
                        ),
                        column(6,
                               sliderInput("fc_cut","Cutoff LogFC Value:",min=0,max=5,value=1),
                               sliderInput("p_val","Cutoff adjusted p-value:",min=1e-15,max=0.2,value=0.05),
                               actionButton("degs","Find DEGs"),
                               HTML("<BR>"),
                                tags$div(
                                 tags$p("Genes with a lower adjusted p-value than the cutoff and with a higher magnitude log fold change will be considered significantly differentially expressed.")
                               )
                        ),
                      ),
                      HTML("<HR>"),
                      HTML("<BR>"),
                      fluidRow(
                        column(12,
                               textOutput("gen_filt"),
                               dataTableOutput("toptab"),
                               verbatimTextOutput("error")
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
                              HTML("<h5>Interactive Volcano Plot for Calculated DEGs</h5>")
                              
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
                               sliderInput("n", "Cutoff LogFC Value:",min=0,max=5,value=1),
                               sliderInput("m", "Cutoff adjusted p-value:",min=1e-15,max=0.2,value=0.05),
                               checkboxInput("labs_volc","Gene Names")
                        ),
                        column(9,
                               plotOutput("plot1")
                        ),
                    )
)                  


