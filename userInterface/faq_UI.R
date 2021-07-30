faqTab <- tabItem(tabName = "faq",
                    
                           
                  fluidRow(
                    column(12,
                    box("The server function reads these CSV files into a list. For uploading raw CEL files, the code includes a file input for tar zipped files that is then unzipped in the server function. The user can specify whether they have a microarray that requires the oligo package using radio buttons, and depending on their input, the code will use the correct package to read in the CEL files. For the Illumina data, the code works similarly and takes in a tar zipped file containing the raw IDAT files as well as a .bgx file. The server function reads in these files using the read.idat() function. The file also gets data from the GEO database using functions from the GEOQuery package. The user can input an accession number and can specify whether they want the series matrix, raw CEL files, or data set file. Based on the user input, the code uses different GEOQuery functions to read in these files. Lastly, the code inputs metadata files in a similar manner to the CSV files of normalized and pre-processed expression data. ", title = "What are the differences between all the file options in data importation?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = FALSE, width=12, plotOutput("plot_a", height = 100)),
                  
                  
                    box("To automatically assign samples from multiple CSV files to batches, Group A used a combination of functions. They used the seq_along() function to generate a sequence of integers based on the number of CSV files, then used the rep() function to repeat this sequence based on the number of samples per CSV file. This ultimately results in a vector containing the batch number of each sample. They then used the factor function to get an object of the factor class. Factor objects are particularly useful for statistical analysis, which the group will be implementing later.", title = "How does batch correction work?",  
                      status = "primary", solidHeader = TRUE, collapsible = T,
                      collapsed = TRUE, width=12, plotOutput("plot_b", height = 100)),
                  
                  
                    box("Normalization of the data the user imports will make the organization of the data much more structured. 
The RMA function is used to take in an AffyBatch object and turn it into an expression set. The gcrma function is used if the user chooses the gcrma method. The gcrma function takes in the affybatch object and turns it into an expression set using the probe sequence. If the user chooses the mas5 method the MAS5 function would be used. The MAS5 function will normalize each array in the data independently while rma and gcrma use a multi-chip model. ", title = "What is normalization and how does RMA, GCRMA, and MAS5 differ?",  
                      status = "primary", solidHeader = TRUE, collapsible = T,
                      collapsed = TRUE, width=12, plotOutput("plot_c", height = 100)),
                    
                    box("The two choices the user gets is NUSE and RLE. If the user chooses the NUSE method for quality control then at the server end, depending on the file that was imported, the quality control is completed using the NUSE() function. If the user chooses the RLE method, then in the server end the RLE() function is used for quality control using different methods depending on the file type. Once that is complete, the user can see the visualization of the data before the normalization and batch correction. ", title = "What does NUSE and RLE do in quality control?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_d", height = 100)),
                    
                    box("On the server side, if the user chose Boxplot then the boxplot () is used to generate the plot with the x axis representing the sample number and the y axis representing the gene expression values. However if the user chose to visualize the data using a PCA plot the prcomp() is used to calculate the pca values. Then the user will choose the components for plotting the pca and the feature the pca plot will represent. The user will receive input from the server side if the user enters more or less than 2 components and if the user did not specify a feature. Then on the server side, the ggplot() is used to plot the PCA plot. ", title = "How do I analyze quality control boxplot and PCA plot?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_e", height = 100)),
                    
                    box("", title = "How do I analyze quality control boxplot and PCA plot?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_f", height = 100)),
                    
                    box("The Volcano Plot is utilized in the Statistical Analysis for visualizing the top DEGs. The User specifies the LogFC and adjusted P-Values for the Volcano plot. The function used for generating the Volcano Plot is EnhancedVolcano which takes in the user input and the final result for the top table. The Volcano Plot allows the user to visualize how various processes have changed their data. ", title = "How do I analyze volcano plots?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_g", height = 100)),
                    
                    box("The process of identifying and removing outliers is really important because it allows the data to be more reliable. It also lets the user see how the data changed after the outliers are removed. The user can be sure that extreme samples are not causing the results they see, and that results can truly be attributed to differences in gene function and expression.", title = "Why do you remove outliers?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_h", height = 100)),
                    
                    box("To get the KEGG pathways, the function used was the enrichKEGG(), and for the visualization the dotplot() was optimized. Additionally the barplot() was used to create a barplot visualization for the KEGG analysis. The number of categories that were shown for the KEGG analysis was determined by the user. Then the setReadable() was used so that the gene concept network for the significant KEGG pathways could be presented as well. 
The significance of the different plots that were plotted have an immense importance as they represent the top DEGs from the data and with the ENTREZIDs there is additional information to more biological concepts. ", title = "Can I get more info on enrichment KEGG analysis and its process getting to the output?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_i", height = 100)),
                    
                    box("A crucial function in the functional analysis was the select() so that the data could be converted to the Entrenzids. The select function allowed the users data to identify genes from a NIH database.", title = "What is the most important step in Functional Analysis?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_j", height = 100))
                    )
                )
           )
                
               
                     

