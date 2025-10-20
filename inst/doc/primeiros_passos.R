## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = F,
  warning = FALSE
)

## ----results='hide', message=FALSE--------------------------------------------
# if(!require(remotes)){
#     install.packages("remotes")
# }
# 
# if(!require(faunabr)){
# remotes::install_github('wevertonbio/faunabr')}
# 
# library(faunabr)

## -----------------------------------------------------------------------------
# #Criando uma pasta em um diretório temporário
# #Substitua 'file.path(tempdir(), "faunabr")' por um caminho de pasta a ser
# #criada em seu computador
# my_dir <- file.path(file.path(tempdir(), "faunabr"))
# dir.create(my_dir)

## ----results='hide', message=FALSE, warning=FALSE-----------------------------
# get_faunabr(output_dir = my_dir, #Pasta para salvar os dados
#             data_version = "latest", #Obter a versão mais recente
#             translate = FALSE, #Manter versão original em português
#             overwrite = T) #Sobrescrever dados, se eles já existirem

## ----results='hide', message=FALSE, warning=FALSE-----------------------------
# get_faunabr(output_dir = my_dir, #Pasta para salvar os dados
#             data_version = "1.10", #Versão 1.10, publicada em 01-02-2024
#             translate = FALSE, #Manter versão original em português
#             overwrite = T) #Sobrescrever dados, se eles já existirem

## -----------------------------------------------------------------------------
# fauna_version(data_dir = my_dir)
# #> You have the following versions of Fauna do Brasil:
# #>  1.17
# #>  1.10
# #>  It includes the latest version:  1.17

## -----------------------------------------------------------------------------
# #Short version
# bf <- load_faunabr(data_dir = my_dir,
#                    data_version = "latest",
#                    type = "short") #resumida
# #> Loading version 393.401
# colnames(bf) #Ver colunas da versão resumida
# #>  [1] "species"             "subspecies"          "scientificName"
# #>  [4] "validName"           "kingdom"             "phylum"
# #>  [7] "class"               "order"               "family"
# #> [10] "genus"               "lifeForm"            "habitat"
# #> [13] "states"              "countryCode"         "origin"
# #> [16] "taxonomicStatus"     "nomenclaturalStatus" "vernacularName"
# #> [19] "taxonRank"           "id"                  "language"

## -----------------------------------------------------------------------------
# #Complete version
# bf_complete <- load_faunabr(data_dir = my_dir,
#                    data_version = "latest",
#                    type = "complete") #completa
# 
# colnames(bf_complete) #Ver colunas da versão completa
# #>  [1] "id"                       "taxonID"
# #>  [3] "species"                  "subspecies"
# #>  [5] "scientificName"           "validName"
# #>  [7] "validNameUsage"           "parentNameUsage"
# #>  [9] "namePublishedInYear"      "higherClassification"
# #> [11] "kingdom"                  "phylum"
# #> [13] "class"                    "order"
# #> [15] "family"                   "genus"
# #> [17] "specificEpithet"          "infraspecificEpithet"
# #> [19] "taxonRank"                "scientificNameAuthorship"
# #> [21] "taxonomicStatus"          "nomenclaturalStatus"
# #> [23] "vernacularName"           "lifeForm"
# #> [25] "habitat"                  "origin"
# #> [27] "states"                   "countryCode"
# #> [29] "modified"                 "bibliographicCitation"
# #> [31] "relationshipOfResource"   "language"

## -----------------------------------------------------------------------------
# # Traduzir do português para o inglês
# bf_ingles <- translate_faunabr(data = bf, to = "en")
# # Ver formas de vida (em ingles)
# fauna_attributes(bf_ingles, "lifeForm")
# #>  $lifeForm
# #>                  lifeForm
# #> 1                colonial
# #> 2               commensal
# #> 3            ectoparasite
# #> 4          ectoparasitoid
# #> 5            endoparasite
# #> 6          endoparasitoid
# #> 7                epibiont
# #> 8                eusocial
# #> 9  free_living_individual
# #> 10              herbivore
# #> 11        hyperparasitoid
# #> 12              inquiline
# #> 13            mutualistic
# #> 14              polynizer
# #> 15               predator
# #> 16                sessile
# 
# # Traduzir do inglês para o português
# bf_portugues <- translate_faunabr(data = bf_ingles, to = "pt_br")
# #Ver formas de vida disponíveis em portugues novamente
# fauna_attributes(bf_portugues, "lifeForm")
# #>  $lifeForm
# #>                 lifeForm
# #> 1               colonial
# #> 2               comensal
# #> 3           ectoparasito
# #> 4        ectoparasitoide
# #> 5           endoparasito
# #> 6        endoparasitoide
# #> 7              epibionte
# #> 8              eussocial
# #> 9              herbivoro
# #> 10      hiperparasitoide
# #> 11             inquilino
# #> 12                mutual
# #> 13           polinizador
# #> 14              predador
# #> 15                sessil
# #> 16 vida_livre_individual

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
# write.csv(x = bf,
#           file = file.path(my_dir, "BrazilianFauna.csv"),
#           row.names = F)

