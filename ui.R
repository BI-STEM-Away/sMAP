# Dashboard UI
source('userInterface/introduction_UI.R')
source('userInterface/dataImport_UI.R')
source('userInterface/qualityControl_UI.R')
source('userInterface/sampleGrouping_UI.R')
source('userInterface/degAnalysis_UI.R')
source('userInterface/functionalAnalysis_UI.R')
source('userInterface/faq_UI.R')
source('userInterface/contact_UI.R')
options(shiny.maxRequestSize = 10e40)

sidebar <- dashboardSidebar(
  skin = "light",
  sidebarMenu(id = "tabs",
              menuItem("Introduction", tabName = "introduction", 
                       icon = icon("arrow-right")),
            #  bs4SidebarHeader("Data Importation"),
              menuItem("Upload Data", tabName = "dataImport",
                       icon = icon("upload")),
         #     bs4SidebarHeader("Quality Control"),
              menuItem("Quality Control", tabName = "qualityControl", 
                       icon = icon("vials"),
                       menuSubItem("QC", tabName = "qC"),
                       menuSubItem("Normalization", tabName = "normalization"),
                       menuSubItem("Batch Correction", tabName = "batchCorrection"),
                       menuSubItem("Potential Outliers", tabName = "potentialOutliers")
              ),
            #  bs4SidebarHeader("Grouping of Samples"),
              menuItem("Sample Grouping", tabName = "sampleGrouping", 
                       icon = icon("object-group")),
       #       bs4SidebarHeader("Statistical Analysis"),
              menuItem("Statistical Analysis", tabName = "degAnalysis", 
                       icon = icon("dna"),
                       menuSubItem("Top DEGs", tabName="topDEGs"),
                       menuSubItem("Volcano Plot", tabName="volcanoPlot")
                       
              ),
     #         bs4SidebarHeader("Functional Analysis"),
              menuItem("Functional Analysis", tabName = "functionalAnalysis", 
                       icon = icon("project-diagram"),
                       menuSubItem("Functional Enrichment", 
                                   tabName="functionalEnrichmentAnalysis"),
                       menuSubItem("Gene-Concept Network", tabName="geneConceptNetwork"),
                       menuSubItem("Gene Set Enrichment", tabName="gsea")
              ),
              bs4SidebarHeader("Help"),
              #              menuItem("Docs", tabName = "docs",  icon = icon("book")),
              menuItem("FAQs", icon = icon("question-circle"), tabName = "faq"),
              menuItem("Contact", tabName = "contact", icon = icon("users"))
  )
)

body <- dashboardBody(
  tabItems(
    introductionTab,
    dataImportTab,
    # qualityControlTab,
      qCTab,
      normalizationTab,
      batchCorrectionTab,
      potentialOutliersTab,
    sampleGroupingTab,
    # degAnalysisTab,
      topDEGsTab,
      volcanoPlotTab,
    # functionalAnalysisTab,
      functionalEnrichmentAnalysisTab,
      geneConceptNetworkTab,
      gseaTab,
    #    docsTab,
    faqTab,
    contactTab
  ),
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css"),
    tags$script(src = "js/tform.js")
  )
)

# Valid statuses are: primary, secondary, info, success, warning, danger, gray-dark, gray, white, indigo, lightblue, navy, purple, fuchsia, pink, maroon, orange, lime, teal, olive.
title <- dashboardBrand(
  title = "sMAP",
  color = "primary",
  opacity = 1,
  href = "https://stemaway.com/",
)

controlbar <- dashboardControlbar(
  id = NULL,
  disable = FALSE,
  width = 500,
  collapse = TRUE,
  skin = "light",
  controlbarMenu(
    div(class="typeform-widget", 'data-url' ="https://form.typeform.com/to/GoJ0NzhN?typeform-medium=embed-snippet", style="width: 85%; height: 450px;"),
    h1("Questions? Feedback?"),
    p("Please leave us a comment in the link below"),
    p("Links:"), 
    a(strong("Typeform"), href = "https://www.typeform.com/", style = "font-size : 25px;")

))

dashboardPage(
  freshTheme = create_theme(
    bs4dash_vars(
      navbar_light_color = "#040404"
    ),
    bs4dash_layout(
      main_bg = "#fffffc" 
    ),
    bs4dash_sidebar_light(
      bg = "#FFF",
      color = "#040404",
      hover_color = "#0C4767",
    ),
    bs4dash_status(
      primary = "#57A773", danger = "#BF616A", success = '#57A773', warning = '#F7B538', info = "#57a773"
    ),
    bs4dash_color(
      blue = '#4281A4', 
      lime = '#ffffff'
    )
  ),
  dashboardHeader(
    fixed = TRUE,
    border = TRUE,
    status = 'lightgray',
    title = title,
    div(style = "margin-left:auto;margin-right:auto; text-align:center; color:black",HTML('<strong>sMAP: Standard Microarray Analysis Pipeline</strong>'))
  ),
  sidebar,
  body,
  controlbar,
  footer = dashboardFooter(
    left = a(
      href = "https://github.com/BI-STEM-Away/",
      target = "_blank", "@BI-STEM-Away"
    ),
    right = "sMAP: 2021"
  ),
  fullscreen = TRUE, dark = NULL
)

