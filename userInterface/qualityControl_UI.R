qCTab <- tabItem(tabName = "qC",
               fluidRow(
                 column(2,
                        div(style = "display:inline-block; float:left", 
                            actionButton('backTo_dataImport', label = 'Back', status = "success"))
                 ),
                 column(8, align="center",
                        HTML("<h5>Visualization Before Processing</h5>")
                        
                 ),
                 column(2,
                        div(style = "display:inline-block; float:right", 
                            actionButton('to_normalization', label = 'Next', status = "success"))
                 )
               ),
               HTML("<HR>"),
               HTML("<BR>"),
                fluidRow(
                    column(4,
                           #Selection for user to visualize raw data
                           selectInput("qc_method", "Select QC visualization method before normalization.", choices = c("NUSE","RLE","PCA","Boxplot")),
                           
                           actionButton("vis_dat","Visualize"),
                           conditionalPanel(condition="input.qc_method=='PCA' && input.vis_dat!=0",
                                            htmlOutput("pc_comp_raw"),
                                            htmlOutput("feat_raw"),
                                            uiOutput("pcplot_raw_button")
  
                           ),
                           HTML("<BR>"),
                           HTML("<BR>"),
                           tags$div(
                             tags$p("Quality control is crucial because it checks whether the data is reliable. Normalized unscaled standard errors (NUSE) and Relative Log Expression (RLE) plots are two different
          methods that are used for quality control. NUSE effectively compares the probeset standard errors between samples. RLE plots show the relative intensity values between samples.")
                           ),
                    ),
                    column(8,
                           textOutput("pcwarnraw"),
                           plotOutput("plot_raw"),
                           
                           
                    )
                )
)

normalizationTab <- tabItem(tabName = "normalization",
                            
                fluidRow(
                  column(2,
                         div(style = "display:inline-block; float:left", 
                             actionButton('backTo_qC', label = 'Back', status = "success"))
                  ),
                  column(8, align="center",
                         HTML("<h5>Normalization</h5>")
                         
                  ),
                  column(2,
                         div(style = "display:inline-block; float:right", 
                             actionButton('to_batchCorrection', label = 'Next', status = "success"))
                  )
                ),
                HTML("<HR>"),
                HTML("<BR>"),
                  fluidRow(
                      column(6,
                             radioButtons("normlztype","Which normalization method do you want to use?", choices=list("RMA","GCRMA","MAS5")),
                             actionButton("normlzdata","Begin Normalization"),
                             tags$div(
                               tags$p("Normalization of the data will make feature extraction easier and the organization of the data much more structured. 
            The MAS5 function will normalize each chip in the data independently while RMA and GCRMA use a multi-chip model. NOTE: If the Affymetrix Human Gene 1.0 ST Array was used, only RMA can be used.")
                             ),
                      ),
                      column(6,
                             textOutput("normal"),
                             textOutput("norm_comp"),
                             
                      )
                  )
)

batchCorrectionTab <- tabItem(tabName = "batchCorrection",
            
          fluidRow(
            column(2,
                   div(style = "display:inline-block; float:left", 
                       actionButton('backTo_normalization', label = 'Back', status = "success"))
            ),
            column(8, align="center",
                   HTML("<h5>Batch Correction & Visualization After Processing</h5>")
                   
            ),
            column(2,
                   div(style = "display:inline-block; float:right", 
                       actionButton('to_potentialOutliers', label = 'Next', status = "success"))
            )
          ),
          HTML("<HR>"),
          HTML("<BR>"),
                              
         fluidRow(
             column(6,
                    htmlOutput("batch_cat"),
                    actionButton("startbatch","Perform Batch Correction"),
                    tags$div(
                      tags$p("Batch Correction makes two batches comparable to one another by correcting for differences in equipment and experimentation. 
    As a result, after batch correction, the two batches can be used for the same analysis.
    In Batch correction the normalized data will be the input and the returned value is an expression matrix that is corrected for batch effects ")
                    ),
                    selectInput("qc_method2", "Choose a QC visualization method after normalization.", choices = c("Boxplot","PCA")),
                    actionButton("vis_button", "Next"),
                    tags$div(
                      tags$p("Visualizing the data after the normalization is complete will allow you to see how your data has changed due to 
    normalization. Both the boxplot and the PCA will show you the quality control that was done on the data. The boxplot will
    help to visualize the outliers while the PCA plot will help visualize patterns and variety in the data.")
                    ),
                    conditionalPanel(condition="input.qc_method2=='PCA' && input.vis_button!=0",
                                     htmlOutput("pc_comp"),
                                     htmlOutput("feat"),
                                     actionButton("pcplot","Plot Principal Components"), 
                                     )
             ),
             column(6,
                    textOutput("batch_com"),
                    
                    textOutput("pcwarn"),
                    #textOutput("plot_status"),
                    plotOutput("qcplot"),
                   
                    
             )
         )
)

potentialOutliersTab <- tabItem(tabName = "potentialOutliers",
                                
                                
                                
                                
            fluidRow(
              column(2,
                     div(style = "display:inline-block; float:left", 
                         actionButton('backTo_batchCorrection', label = 'Back', status = "success"))
              ),
              column(8, align="center",
                     HTML("<h5>Find Potential Outliers</h5>")
                     
              ),
              column(2,
                     div(style = "display:inline-block; float:right", 
                         actionButton('to_sampleGrouping', label = 'Next', status = "success"))
              )
            ),
            HTML("<HR>"),
            HTML("<BR>"),
            fluidRow(
                column(6,
                       selectInput("outmethod","Outlier Detection Method",choices=c("KS","sum", "upperquartile")),
                       actionButton("getout","Find Potential Outliers"),
                       actionButton("update","Show Updated List of Samples"),
                       tags$div(
                         tags$p("In order for the data more reliable, the outliers need to be identified and removed so that that results can truly be 
attributed to differences in gene function and expression. You can choose from three different methods, and  all three will 
find and remove the outliers. ")
                       )
                ),
                column(12,
                       p("Potential Outliers:"),
                       uiOutput("remove"),
                       textOutput("potout"),
                       plotOutput("outplot"),
                       dataTableOutput("newexprs")
                    
                )
            )
)
