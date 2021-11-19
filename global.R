packages12<-c("bs4Dash","shiny","shinybusy","fresh","oligo","GEOquery","affy","limma","arrayQualityMetrics","sva","Biobase","affyPLM","EnhancedVolcano","AnnotationDbi","hgu133plus2.db","WGCNA","clusterProfiler","msigdbr","impute","org.Hs.eg.db","ggplot2","shinyWidgets","DT","enrichplot","hugene11sttranscriptcluster.db")
for(y in packages12){
#    BiocManager::install(y)
    library(y,character.only=TRUE)
}
library(knitr)
library(Hmisc)
library(htmltools)
library(markdown)
# library(tidyr)
# library(magrittr)
# library(stringr)
# library(R.utils)

# Demo File paths
demo.5Samples.exp <- "www/demoData/5_samples_exp.csv"
demo.5Samples.meta <- "www/demoData/5_samples_metadata.csv"
demo.5Samples.cel <- list("www/demoData/GSM494556.CEL.gz",
                          "www/demoData/GSM494557.CEL.gz",
                          "www/demoData/GSM494558.CEL.gz",
                          "www/demoData/GSM494559.CEL.gz",
                          "www/demoData/GSM494560.CEL.gz")
