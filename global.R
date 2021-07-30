# Load the libraries and import function files here.
# Global.R is run one time at app initiallization. 
library(bs4Dash)
library(shiny)
library(shinybusy)
library(fresh)

library(oligo)
library(GEOquery)
library(affy)
library(limma)
library(arrayQualityMetrics)
library(sva)
library(Biobase)
library(affyPLM)
library(EnhancedVolcano)
library(AnnotationDbi)
library(hgu133plus2.db)
library(WGCNA)
library(clusterProfiler)
library(msigdbr)
library(impute)
library(org.Hs.eg.db)
library(ggplot2)
library(pheatmap)
library(shinyWidgets)
library(DT)
library(data.table)
library(magrittr)
library(tidyr)
library(enrichplot)
packages12<-c("stringr","R.utils","shinyWidgets")
for(y in packages12){
    library(y,character.only=TRUE)
}
#Import Functions from External R scripts.

source("functions/testFunction.R", local = TRUE)$value
