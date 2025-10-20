## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message  = FALSE,
  eval = FALSE,
  fig.width = 8,
  fig.height = 6
)

## -----------------------------------------------------------------------------
# library(faunabr)
# library(terra)
# #Carregar dados
# bf <- load_faunabr(data_dir = my_dir, #Pasta onde foi salvo o arquivo com get_faunabr()
#                    data_version = "latest", #Versão mais recente
#                    type = "short") #Versão resumida
# #> Loading version 1.3

## -----------------------------------------------------------------------------
# #Espécies de exemplo
# spp <- c("Panthera onca", "Mazama jucunda")
# #Obter polígonos espaciais
# spp_spt <- fauna_spat_occ(data = bf, species = spp, state = TRUE,
#                           country = TRUE, verbose = TRUE)
# #> Getting states of Panthera onca
# #> Getting countries of Panthera onca
# #> Getting states of Mazama jucunda
# #> Getting countries of Mazama jucunda

## -----------------------------------------------------------------------------
# par(mfrow = c(2, 2), mar = c(2, 0, 2, 0))
# plot(spp_spt$`Panthera onca`$states,
#      main = paste0(names(spp_spt)[[1]], " - States"), mar = NA)
# plot(spp_spt$`Panthera onca`$countries,
#      main = paste0(names(spp_spt)[[1]], " - Countries"), mar = NA)
# plot(spp_spt$`Mazama jucunda`$states,
#      main = paste0(names(spp_spt)[[2]], " - States"), mar = NA)
# plot(spp_spt$`Mazama jucunda`$countries,
#      main = paste0(names(spp_spt)[[2]], " - Countries"), mar = NA)

## ----IMG01, eval=TRUE, echo=FALSE---------------------------------------------
knitr::include_graphics("vignettes_img/IMG01.png")

## -----------------------------------------------------------------------------
# my_spp <- c("Panthera onca", "Chaetomys subspinosus")
# pol_spp <- fauna_spat_occ(data = bf, species = my_spp,
#                        state = TRUE, country = TRUE,
#                        verbose = TRUE)
# par(mfrow = c(2, 2), mar = c(2, 0, 2, 0))
# plot(pol_spp$`Panthera onca`$states,
#      main = paste0(names(pol_spp)[[1]], " - States"), mar = NA)
# plot(pol_spp$`Panthera onca`$countries,
#      main = paste0(names(pol_spp)[[1]], " - Countries"), mar = NA)
# plot(pol_spp$`Chaetomys subspinosus`$states,
#      main = paste0(names(pol_spp)[[2]], " - States"), mar = NA)
# plot(pol_spp$`Chaetomys subspinosus`$countries,
#      main = paste0(names(pol_spp)[[2]], " - Countries"), mar = NA)

## ----IMG02, eval=TRUE, echo = FALSE-------------------------------------------
knitr::include_graphics("vignettes_img/IMG02.png")

## -----------------------------------------------------------------------------
# data("occurrences")
# head(occurrences)
# #>         species         x          y  source
# #> 1 Panthera onca -90.38409  17.377023    gbif
# #> 2 Panthera onca -90.24368  17.240507    gbif
# #> 3 Panthera onca -77.36680   0.287624    gbif
# #> 4 Panthera onca -56.61023 -17.239688    gbif
# #> 5 Panthera onca -61.04386  -2.387029    gbif
# #> 6 Panthera onca -77.28850   0.288757    gbif

## -----------------------------------------------------------------------------
# occ_check <- filter_faunabr(data = bf, occ = occurrences,
#                     by_state = TRUE, buffer_state = 20,
#                     by_country = TRUE, buffer_country = 20,
#                     value = "flag&clean", keep_columns = TRUE,
#                     verbose = FALSE)
# #> Returning list with flagged and cleaned occurrences

## ----warning=FALSE, results='hide'--------------------------------------------
# #Instala pacote (se necessário)
# if(!require(mapview)){
#     install.packages("mapview")
# }
# #Carregar pacote
# library(mapview)
# library(terra)

## ----fig.width= 9-------------------------------------------------------------
# #Converter pontos para spatvector
# panthera_occ <- subset(occ_check$flagged,
#                        occ_check$flagged$species == "Panthera onca")
# panthera_occ <- vect(panthera_occ, geom = c("x", "y"),
#                      crs = crs(pol_spp$`Panthera onca`$states))
# 
# #Plot interativo
# mapview(pol_spp$`Panthera onca`$states,
#         layer.name = "States with confirmed occurrences") +
#   mapview(panthera_occ, zcol = "inside_state", layer.name = "Inside state?",
#           col.regions = c("red", "green"))

## ----IMG03, eval=TRUE, echo = FALSE, fig.pos="H", out.width="90%"-------------
knitr::include_graphics("vignettes_img/IMG03.png")

## ----fig.width= 9-------------------------------------------------------------
# #Plot interativo
# mapview(pol_spp$`Panthera onca`$countries,
#         layer.name = "Countries with confirmed occurrences", burst = TRUE, legend = F) +
#   mapview(panthera_occ, zcol = "inside_country",
#           col.regions = c("red", "green"),
#           layer.name = "Inside country?")

## ----IMG04, eval=TRUE, echo = FALSE, fig.pos="H", out.width="90%"-------------
knitr::include_graphics("vignettes_img/IMG04.png")

