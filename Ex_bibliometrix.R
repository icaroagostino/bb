library(bibliometrix) # pacote para análise bibliométrica

setwd("C:/Users/Prologis01.ProLogis/Desktop/Exemplo_bibliometrix")

#-------------------------------------------------------------------

# Importar e converter dados

# Ler bases

b1 <- readFiles("savedrecs.bib") # WoS

b2 <- readFiles("scopus.bib") # Scopus

# Converter pra dataframe

# colocar base "isi" ou "scopus"
# e o formato "bibtex" ou "plaintext"

c1 <- convert2df(b1, dbsource="isi",format="bibtex") # WoS

c2 <- convert2df(b2, dbsource="scopus",format="bibtex") # Scopus

# Unir e remover duplicatas

M <- mergeDbSources(c1, c2, remove.duplicated=TRUE)

#-------------------------------------------------------------------

# Principais características (Análise Descritiva)

results <- biblioAnalysis(M) 

summary(results, k=10, pause=F, width=130)

plot(x=results, k=10, pause=F) # Gráficos

#-------------------------------------------------------------------

# Referências mais citadas

CR <- citations(M, field = "article", sep = ";")

cbind(CR$Cited[1:20])

#-------------------------------------------------------------------

# Rede de Co-citação

NetMatrix <- biblioNetwork(M, analysis = "co-citation",
                           network = "references", sep = ";")

net=networkPlot(NetMatrix, n = 40, Title = "Co-Citation Network",
                type = "fruchterman", size.cex=TRUE, size=20,
                remove.multiple = F, labelsize=0.7,edgesize = 50,
                edges.min=2)

#-------------------------------------------------------------------

# Historiograph - Direct citation linkages

histResults <- histNetwork(M, min.citations=quantile(M$TC,0.40), sep = ";")

options(width = 130)

net <- histPlot(histResults, n=20, size.cex=TRUE, size = 5,
                labelsize = 3, arrowsize = 1)

#-------------------------------------------------------------------

# Estrutura COnceitual

CS <- conceptualStructure(M, method="CA", field="ID",
                          minDegree=4, k.max = 8,
                          stemming=f, labelsize=8,documents=20)