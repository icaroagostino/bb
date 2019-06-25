setwd(getwd())

library(bibliometrix)

openxlsx::write.xlsx(
  
  mergeDbSources(
    
    convert2df(
      readFiles("savedrecs.bib"),
      dbsource="isi",format="bibtex"),
    
    convert2df(
      readFiles("scopus.bib"),
      dbsource="scopus",format="bibtex"),
    
    remove.duplicated=TRUE),

"Base_Junta.xlsx")

biblioshiny()