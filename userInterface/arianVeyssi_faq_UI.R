faqTab <- tabItem(tabName = "faq",
                    
                           
                  fluidRow(
                    column(12,
                    box("The server function reads these CSV files into a list. For uploading raw CEL files, the code includes a file input for tar zipped files that is then unzipped in the server function. The user can specify whether they have a microarray that requires the oligo package using radio buttons, and depending on their input, the code will use the correct package to read in the CEL files. For the Illumina data, the code works similarly and takes in a tar zipped file containing the raw IDAT files as well as a .bgx file. The server function reads in these files using the read.idat() function. The file also gets data from the GEO database using functions from the GEOQuery package. The user can input an accession number and can specify whether they want the series matrix, raw CEL files, or data set file. Based on the user input, the code uses different GEOQuery functions to read in these files. Lastly, the code inputs metadata files in a similar manner to the CSV files of normalized and pre-processed expression data. ", title = "What are the differences between all the file options in data importation?",  
                        status = "primary", solidHeader = TRUE, collapsible = T,
                        collapsed = TRUE, width=12, plotOutput("plot_a", height = 100)),
                  
                  
                    box("To automatically assign samples from multiple CSV files to batches, Group A used a combination of functions. They used the seq_along() function to generate a sequence of integers based on the number of CSV files, then used the rep() function to repeat this sequence based on the number of samples per CSV file. This ultimately results in a vector containing the batch number of each sample. They then used the factor function to get an object of the factor class. Factor objects are particularly useful for statistical analysis, which the group will be implementing later.", title = "How does batch correction work?",  
                      status = "primary", solidHeader = TRUE, collapsible = T,
                      collapsed = TRUE, width=12, plotOutput("plot_b", height = 100)),
                  
                  
                    box("The answer is ", title = "Question 3: ",  
                      status = "primary", solidHeader = TRUE, collapsible = T,
                      collapsed = TRUE, width=12, plotOutput("plot_c", height = 100))
                    )
                )
           )
                
                
               
                     

