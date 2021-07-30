# functionalAnalysisTab <- tabItem(tabName = "functionalAnalysis",
#                       fluidRow(
#                         column(12,
#                           HTML("Functional Analysis Page")
#                         )
#                       )
# )

functionalEnrichmentAnalysisTab <- tabItem(tabName = "functionalEnrichmentAnalysis",
                      fluidRow(
                          
                          column(2,
                                 div(style = "display:inline-block; float:left", 
                                     actionButton('backTo_topDEGs', label = 'Back', status = "success"))
                          ),
                          column(8, align="center",
                                 HTML("<h5>Functional Enrichment Analysis</h5>")
                                 
                          ),
                          # @roman_ramirez
                          column(2,
                                 div(style = "display:inline-block; float:right", 
                                     actionButton('to_geneConceptNetwork', label = 'Next', status = "success"))
                          )
                      ),
                      HTML("<HR>"),
                      HTML("<BR>"),
                      fluidRow(
#                                downloadButton("exportkegg","Download KEGG Plots")
                         column(12,
                                actionButton("kegg","KEGG Analysis")
                        )
                        ),
                  HTML("<HR>"),
                  HTML("<BR>"),
                   fluidRow(
                     column(12,
                            sliderInput("x", "Number of categories shown", 0, 20,
                                        value =10, step = 2),
                            plotOutput("dotplot"))
                   ),
                  HTML("<HR>"),
                   fluidRow(
                   column(12,
                          sliderInput("y", "Number of categories shown", 0, 20,
                                      value =10, step = 2),
                          plotOutput("barplot"))
                  )
)

geneConceptNetworkTab <- tabItem(tabName = "geneConceptNetwork",
              fluidRow(
                  
                  column(2,
                         div(style = "display:inline-block; float:left", 
                             actionButton('backTo_functionalEnrichmentAnalysis', label = 'Back', status = "success"))
                  ),
                  column(8, align="center",
                         HTML("<h5>Gene Ontology Enrichment Analysis</h5>")
                         
                  ),
                  # @roman_ramirez
                  column(2,
                         div(style = "display:inline-block; float:right", 
                             actionButton('to_gsea', label = 'Next', status = "success"))
                  )
              ),
              HTML("<HR>"),
              HTML("<BR>"),
              fluidRow(
               column(6,
                      selectInput("type","Category for Gene Ontology Analysis",choices=c("Cellular Components","Molecular Functions","Biological Processes"))
                      ),
               column(6,
                      actionButton("go","Gene Ontology Analysis")
               )
                      #downloadButton("exportgo","Download GO Plots")
               ),
               HTML("<HR>"),
               fluidRow(
               column(12,
                sliderInput("a", "Number of categories shown", 0, 20, value =10, step = 2),
                plotOutput("dotplot2")
               )),
              fluidRow(
                column(12,
                       sliderInput("b", "Number of categories shown", 0, 20, value =10, step = 2),
                       plotOutput("barplot2")
               )
                    #  plotOutput("GOgraph")
              )
)                                
gseaTab <- tabItem(tabName = "gsea",
            fluidRow(
                column(2,
                       div(style = "display:inline-block; float:left", 
                           actionButton('backTo_geneConceptNetwork', label = 'Back', status = "success"))
                ),
                column(8, align="center",
                       HTML("<h5>Gene-Set Enrichment Analysis</h5>")
                       
                ),
                # @roman_ramirez
                column(2,
                       div(style = "display:inline-block; float:right", 
                           actionButton('to_transcriptionFactorAnalysis', label = 'Next', status = "success"))
                )
            ),
            HTML("<HR>"),
            HTML("<BR>"),
            fluidRow(
             column(12,
                    actionButton("gsea","Perform GSEA")
             )),
             fluidRow(
             column(12,
                    plotOutput("plot_gsea")
#                    downloadButton("exportgsea","Download GSEA Plot")
             )
         )
)                  
