## Arquivos usados no Meetup | Encontro R - Florianópolis (27/07/19)

Bibliometrix exemplos/arquivos:

- Exemplo de análise em .R
- Exemplo de análise em .Rmd
- Script para unir datasets WoS e Scoupus (passo a passo) em .R
- Script para unir datasets WoS e Scoupus (rápido) em .R
- Slides utilizados no Meetup (27/07/19) em .pdf
- Linha de comando (.cmd) para executar o Script "Unir_FASR.R" diredo do cmd (Sem precisar abrir RStudio)*

##

*__*Obs.:__ Para executar o arquivo "FAST.cmd" é necessário antes ter instalado R, RStudio, o pacote bibliometrix, ter configurado o R como variável de ambiente (para o sistema conseguir executar o script da linha de comando). O arquivo deve ser executado na mesma pasta que as saídas das bases estão (em formato .bib e com o nome de saída padrão da base) juntamente com o arquivo Unir_FAST.R, via cmd ele vai ler e exutar os comandos contidos no Unir_FAST.R:*

- *Ler os arquivos .bib da WoS e Scopus*
- *Converter em um formato padrão de data.frame*
- *Unir os dois data.frames e retirar documentos duplicados*
- *Escrever um arquivo .xlsx no mesmo diretório*
- *Abrir o Biblioshiny()*
