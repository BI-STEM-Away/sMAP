
# Dashboard UI
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/introduction_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/dataImport_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/qualityControl_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/sampleGrouping_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/degAnalysis_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/functionalAnalysis_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/faq_UI.R')
source('C:/Users/icy20/OneDrive/Desktop/Statistics/R Template/contact_UI.R')

sidebar <- dashboardSidebar(
  skin = "light",
  sidebarMenu(id = "tabs",
              menuItem("Introduction", tabName = "introduction", 
                       icon = icon("arrow-right")),
              bs4SidebarHeader("Data Importation"),
              menuItem("Upload Data", tabName = "dataImport",
                       icon = icon("upload")),
              bs4SidebarHeader("Quality Control"),
              menuItem("QC", tabName = "qualityControl", 
                       icon = icon("object-group")),
              bs4SidebarHeader("Grouping of Samples"),
              menuItem("Sample Grouping", tabName = "sampleGrouping", 
                       icon = icon("object-group")),
              bs4SidebarHeader("Statistical Analysis"),
              menuItem("DEG", tabName = "degAnalysis", 
                       icon = icon("chart-bar")),
              bs4SidebarHeader("Functional Analysis"),
              menuItem("Functional", tabName = "functionalAnalysis", 
                       icon = icon("chart-bar")),
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
    qualityControlTab,
    sampleGroupingTab,
    degAnalysisTab,
    functionalAnalysisTab,
    #    docsTab,
    faqTab,
    contactTab
  ),
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")
  )
)





title <- dashboardBrand(
  title = "App Name",
  color = "success",
  opacity = 1
)



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
      primary = "#57A773", danger = "#BF616A", success = '#57A773', warning = '#F7B538', info = "#0C4767"
    ),
    bs4dash_color(
      blue = '#4281A4', 
      lime = '#EBEBEB'
    )
  ),
  dashboardHeader(
    fixed = TRUE,
    border = TRUE,
    status = 'lime',
    #    sidebarIcon = shiny::icon("water"),
    title = title,
    div(style = "margin-left:auto;margin-right:auto; text-align:center; color:black",HTML('<strong>App Name and tag line.</strong>'), )
  ),
  sidebar,
  body,
  #FEEDBACK FORM 
  controlbar = dashboardControlbar(tags$iframe(d = "googleform",
                                               src = "https://docs.google.com/forms/d/e/1FAIpQLScR2k-Y-TjV7aMUiZRZYtJ743zTy1bAYHuAUCN_DD5as-kJhg/viewform?usp=sf_link",
                                               width = 400,
                                               height = 600,
                                               frameborder = 0,
                                               marginheight = 0)),

  
  footer = dashboardFooter(
    left = a(
      href = "#",
      target = "_blank", "@STEM-Away"
    ),
    right = "AppName: 2021"
  ),
  fullscreen = TRUE, dark = NULL
)
