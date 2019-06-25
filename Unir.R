rm(list=ls())

library(bibliometrix)
library(openxlsx)

# Ler bases

# Entre parenteses colocar o nome do arquivo com o formato

b1 <- readFiles("savedrecs.bib") # WoS

b2 <- readFiles("scopus.bib") # Scopus

# Converter pra dataframe

# colocar base "isi" ou "scopus"
# e o formato "bibtex" ou "plaintext"

c1 <- convert2df(b1, dbsource="isi",format="bibtex") # WoS

c2 <- convert2df(b2, dbsource="scopus",format="bibtex") # Scopus

# Unir e remover duplicatas

M <- mergeDbSources(c1, c2, remove.duplicated=TRUE)

# Salvar em Excel

write.xlsx(M, "Base_Junta.xlsx")

biblioshiny()