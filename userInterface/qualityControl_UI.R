qCTab <- tabItem(tabName = "qC",
                              fluidRow(
                                  column(12,
                                         fluidRow(
                                             column(1,
                                                    div(style = "display:inline-block; float:left", 
                                                        actionButton('backTo_dataImport', label = 'Back', status = "success"))
                                             ),
                                             
                                             column(10, align="center",
                                                    HTML("<h3><b>Quality Control</b></h3>")
                                                    
                                             ),
                                             # @roman_ramirez
                                             column(width = 1,
                                                    div(style = "display:inline-block; float:right", 
                                                        actionButton('to_normalization', label = 'Next', status = "success"))
                                             )
                                         )
                                  ),
                                  column(6,
                                         #Selection for user to visualize raw data
                                         selectInput("qc_method", "Choose a QC visualization method before normalization.", choices = c("NUSE","RLE")),
                                         actionButton("vis_dat","Visualize Data"),
                                         #ShreyaVora14
                                         tags$div(
                                           tags$p("Quality control is crucial because it checks whether the data is reliable. NUSE and RLE are two different
                        methods that are used for quality control. ")
                                         ),
                                  ),
                                  column(6,
                                         
                                         plotOutput("plot_raw"),
                                         textOutput("normal"),
                                         textOutput("norm_comp"),
                                         
                                  ),
                              )
)

normalizationTab <- tabItem(tabName = "normalization",
                              fluidRow(
                                  column(12,
                                         fluidRow(
                                            
                                             column(1,
                                                    div(style = "display:inline-block; float:left", 
                                                        actionButton('backTo_qC', label = 'Back', status = "success"))
                                             ),
                                             
                                             
                                             column(10, align="center",
                                                    HTML("<h3><b>Normalization</b></h3>")
                                                    
                                             ),
                                             
                                             # @roman_ramirez
                                             column(width = 1,
                                                    div(style = "display:inline-block; float:right", 
                                                        actionButton('to_batchCorrection', label = 'Next', status = "success"))
                                             )
                                         )
                                  ),
                                  column(6,
                                         #disha-22
                                         #Input for normalization methods
                                         radioButtons("normlztype","Which normalization method do you want to use?", choices=list("RMA","GCRMA","MAS5")),
                                         actionButton("normlzdata","Begin Normalization"),
                                         #ShreyaVora14
                                         tags$div(
                                           tags$p("Normalization of the data will make feature extraction easier and the organization of the data much more structured. 
                        The MAS5 function will normalize each array in the data independently while rma and gcrma use a multi-chip model. ")
                                         ),
                                  ),
                                  column(6,
                                         textOutput("batch_com"),
                                         htmlOutput("pc_comp"),
                                         htmlOutput("feat"),
                                  )
                              )
)

batchCorrectionTab <- tabItem(tabName = "batchCorrection",
                             fluidRow(
                                 column(12,
                                        fluidRow(
                                            column(1, 
                                                   div(style = "display:inline-block; float:left", 
                                                       actionButton('backTo_normalization', label = 'Back', status = "success"))
                                            ),
                                            
                                            column(10, align="center",
                                                   HTML("<h3><b>Batch Correction</b></h3>")
                                                   
                                            ),
                                            # @roman_ramirez
                                            column(width = 1,
                                                   div(style = "display:inline-block; float:right", 
                                                       actionButton('to_potentialOutliers', label = 'Next', status = "success"))
                                            )
                                        )
                                     
                                 ),
                                 column(6,
                                        #nk468188
                                        #Input to perform batch correction
                                        htmlOutput("batch_cat"),
                                        actionButton("startbatch","Perform Batch Correction"),
                                        #ShreyaVora14
                                        tags$div(
                                          tags$p("Batch Correction makes two batches comparable to one another by correcting for differences in equipment and experimentation. 
                        As a result, after batch correction, the two batches can be used for the same analysis.
                        In Batch correction the normalized data will be the input and the returned value is an expression matrix that is corrected for batch effects ")
                                        ),
                                        #xgeng3
                                        #Input to visualize via PCA or boxplot
                                        selectInput("qc_method2", "Choose a QC visualization method after normalization.", choices = c("Boxplot","PCA")),
                                        actionButton("vis_button", "Generate Plot"),
                                        #ShreyaVora14
                                        tags$div(
                                          tags$p("Visualizing the data after the normalization is complete will allow you to see how your data has changed due to 
                        normalization. Both the boxplot and the PCA will show you the quality control that was done on the data. The boxplot will
                        help to visualize the outliers while the PCA plot will help visualize patterns and variety in the data.")
                                        ),
                                 ),
                                 column(6,
                                        actionButton("pcplot","Plot Principal Components"),
                                        textOutput("pcwarn"),
                                        textOutput("plot_status"),
                                        plotOutput("qcplot"),
                                        htmlOutput("remove"),
                                        
                                 )
                             )
)

potentialOutliersTab <- tabItem(tabName = "potentialOutliers",
                                    fluidRow(
                                        column(12,
                                          fluidRow(
                                              
                                              column(1,
                                                     div(style = "display:inline-block; float:left", 
                                                         actionButton('backTo_batchCorrection', label = 'Back', status = "success"))
                                              ),
                                              column(10, align="center",
                                                     HTML("<h3><b>Find Potential Outliers</b></h3>")
                                                     
                                              ),
                                              
                                              # @roman_ramirez
                                              column(width = 1,
                                                     div(style = "display:inline-block; float:right", 
                                                         actionButton('to_sampleGrouping', label = 'Next', status = "success"))
                                              )
                                          )  
                                        ),
                                        column(6,
                                               #nk468188
                                               #Finding outliers
                                               selectInput("outmethod","Outlier Detection Method",choices=c("KS","sum", "upperquartile")),
                                              
                                               actionButton("getout","Find Potential Outliers"),
                                               actionButton("update","Show Updated List of Samples"),
                                               #ShreyaVora14
                                               tags$div(
                                                 tags$p("In order for the data more reliable, the outliers need to be identified and removed so that that results can truly be 
                 attributed to differences in gene function and expression. You can choose from three different methods, and  all three will 
                 find and remove the outliers. ")
                                               )
                                        ),
                                        column(6,
                                               p("Potential Outliers:"),
                                               uiOutput("potout"),
                                               plotOutput("outplot"),
                                               dataTableOutput("newexprs")
                                            
                                        )
                                    )
)
