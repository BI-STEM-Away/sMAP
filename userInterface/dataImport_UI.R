dataImportTab <- tabItem(tabName = "dataImport",
                  fluidRow(
                      column(2,
                             div(style = "display:inline-block; float:left", 
                                 actionButton('backTo_introduction', label = 'Back', status = "success"))
                      ),
                      column(8, align="center",
                             HTML("<h5>Upload Data Files in sMAP to begin</h5>")
                             
                      ),
                      # @roman_ramirez
                      column(2,
                             div(style = "display:inline-block; float:right", 
                                 actionButton('to_qC', label = 'Next', status = "success"))
                      )
                  ),
                HTML("<HR>"),
                HTML("<BR>"),
                fluidRow(
                    column(4,
                          #Selection Input to decide what type of file they want to input: CSV/txt, CEL files, IDAT files, or GEO Accession number
                          selectInput("dat_type","Input Type",choices=list("Processed Expression Data (CSV/TXT File)","Raw Affymetrix Data (.tar File Containing CEL Files)","GEO Accession Number"),
                                width = '350px'
                                 )),
                    column(3,
                          #Panel that appears if CSV/txt file type selected
                          conditionalPanel(condition="input.dat_type=='Processed Expression Data (CSV/TXT File)'",
                                           #ShreyaVora14
                                           fileInput("file", "Processed Expression Data (CSV/TXT)",multiple=FALSE,accept=c(".csv",".txt")),
                                           #Input that comes from server function; takes columns of metadata, asks user which feature to analyze
                          ),
                          #Panel that appears if GEO Database desired
                          conditionalPanel(condition="input.dat_type=='GEO Accession Number'",
                                           textInput("geoname","Input the GEO accession number of the series matrix of interest."),
                          ),
                          #Panel that appears if Raw Affymetrix data selected
                          conditionalPanel(condition="input.dat_type=='Raw Affymetrix Data (.tar File Containing CEL Files)'",
                                           fileInput("celzip","Raw Affymetrix Data (.tar)"),
                                           #Check if the user used microarray requiring oligo package
                                           selectInput("oligo","What microarray platform did you use?",choices=list("Gene ST Array","Exon ST Array","Other")),
                          )),
                    column(3,      
                          #Input that comes from server function; takes columns of metadata, asks user which feature to analyze
                          fileInput("metadata","Metadata (CSV)")
                          ),
                          
                  column(2,
                          actionButton("loaddat","Load Data")
                          )
                ),
                HTML("<HR>"),
                HTML("<BR>"),
                fluidRow(
                  column(12,
                     
                     
                          #ShreyaVora14 and nk468188
                          #Data table summary of inputted data
                         add_busy_bar(),
                          dataTableOutput("csv_summary"),
                          dataTableOutput("raw_summary")
                   )
                 )
)

