packages12<-c("bs4Dash","shiny","shinybusy","fresh","oligo","GEOquery","affy","limma","arrayQualityMetrics","sva","Biobase","affyPLM","EnhancedVolcano","AnnotationDbi","hgu133plus2.db","WGCNA","clusterProfiler","msigdbr","impute","org.Hs.eg.db","ggplot2","shinyWidgets","DT","enrichplot","hugene11sttranscriptcluster.db")
for(y in packages12){
#    BiocManager::install(y)
    library(y,character.only=TRUE)
}
library(knitr)
library(Hmisc)
library(htmltools)
library(markdown)


# Demo File paths
demo.Samples.exp <- "www/demoData/Demo_Expression_Table.csv"
demo.Samples.meta <- "www/demoData/Demo_Metadata.csv"
demo.Samples.cel <- list( "www/demoData/GSM494556.CEL.gz",
                          "www/demoData/GSM494557.CEL.gz",
                          "www/demoData/GSM494558.CEL.gz",
                          "www/demoData/GSM494559.CEL.gz",
                       	  "www/demoData/GSM494560.CEL.gz",
                          "www/demoData/GSM494561.CEL.gz",
                          "www/demoData/GSM494562.CEL.gz",
                          "www/demoData/GSM494563.CEL.gz",
			  "www/demoData/GSM494564.CEL.gz",
                          "www/demoData/GSM494565.CEL.gz",

                          "www/demoData/GSM494616.CEL.gz",
                          "www/demoData/GSM494617.CEL.gz",
                          "www/demoData/GSM494618.CEL.gz",
                          "www/demoData/GSM494619.CEL.gz",
                          "www/demoData/GSM494620.CEL.gz",
                          "www/demoData/GSM494621.CEL.gz",
                          "www/demoData/GSM494622.CEL.gz",
                          "www/demoData/GSM494623.CEL.gz",
                          "www/demoData/GSM494624.CEL.gz",
                          "www/demoData/GSM494625.CEL.gz"
                          )
