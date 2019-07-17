library(bibliometrix) # package for bibliometric analysis
library(openxlsx)

setwd("C:/Users/Prologis01.ProLogis/Desktop/Eng_Bib")
rm(list=ls())
#-------------------------------------------------------------------

# Import and convert data

# Read bases

b1 <- readFiles("savedrecs.bib") # WoS

b2 <- readFiles("scopus.bib") # Scopus

# Convert to dataframe

# define database "isi" or "scopus"
# and the format "bibtex" or "plaintext"

c1 <- convert2df(b1, dbsource="isi",format="bibtex") # WoS

c2 <- convert2df(b2, dbsource="scopus",format="bibtex") # Scopus

# Merge and remove duplicates

M <- mergeDbSources(c1, c2, remove.duplicated=TRUE)

write.xlsx(M, "Base_J.xlsx") # write an excel

#-------------------------------------------------------------------

# Main characteristics (Descriptive Analysis)

results <- biblioAnalysis(M)

summary(results, k=10, pause=F, width=130)

plot(x=results, k=10, pause=F) # Graphs

#-------------------------------------------------------------------

# Co-citation Network

NetMatrix <- biblioNetwork(M, analysis = "co-citation",
                           network = "references", sep = ";")

net=networkPlot(NetMatrix, n = 30, Title = "Co-Citation Network",
                type = "fruchterman", size.cex=TRUE, size=20,
                remove.multiple=FALSE, labelsize=0.7,edgesize = 5,
                edges.min=2)

#-------------------------------------------------------------------

# Conceptual Structure

CS <- conceptualStructure(M, method="CA", field="ID",
                          minDegree=4, k.max = 8,
                          stemming=f, labelsize=8,documents=20)
