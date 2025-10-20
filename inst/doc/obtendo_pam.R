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
# #Carregar dados
# bf <- load_faunabr(data_dir = my_dir, #Pasta onde foi salvo o arquivo com get_faunabr()
#                    data_version = "latest", #Versão mais recente
#                    type = "short") #Versão resumida
# #> Loading version 1.3

## -----------------------------------------------------------------------------
# #Selecionar espécies de mamíferos nativos do Brasil:
# br_mammals <- select_fauna(data = bf,
#                            include_subspecies = FALSE, phylum = "all",
#                            class = "Mammalia",
#                            order = "all", family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = "all", filter_states = "in",
#                            country = "BR", filter_country = "in",
#                            origin = "all", taxonomicStatus = "valido")
# #PAM em Estados do Brasil
# pam_mammals <- fauna_pam(data = br_mammals, by_state = TRUE,
#                          by_country = FALSE,
#                          remove_empty_sites = TRUE,
#                          return_richness_summary = TRUE,
#                          return_spatial_richness = TRUE,
#                          return_plot = TRUE)
# #Visualizar (em tibble) PAM com as primeiras 5 espécies nos primeiros 5 sites
# tibble::tibble(pam_mammals$PAM[1:7, 1:5])
# #> # A tibble: 7 × 5
# #>   states `Platyrrhinus aurarius` `Kannabateomys amblyonyx` `Callicebus lucifer` `Cerradomys maracajuensis`
# #>   <fct>                    <dbl>                     <dbl>                <dbl>                      <dbl>
# #> 1 AM                           1                         0                    1                          0
# #> 2 ES                           0                         1                    0                          0
# #> 3 MG                           0                         1                    0                          1
# #> 4 PR                           0                         1                    0                          0
# #> 5 RJ                           0                         1                    0                          0
# #> 6 RS                           0                         1                    0                          0
# #> 7 SC                           0                         1                    0                          0

## -----------------------------------------------------------------------------
# #Visualise (em tibble) a tabela com a riqueza por site
# tibble::tibble(pam_mammals$Richness_summary[1:7,])
# #> # A tibble: 7 × 3
# #> states   richness
# #>   <fct>     <dbl>
# #> 1 AM          225
# #> 2 ES          120
# #> 3 MG          188
# #> 4 PR          116
# #> 5 RJ          133
# #> 6 RS          105
# #> 7 SC          101

## ----IMG09, eval=TRUE, echo = FALSE-------------------------------------------
knitr::include_graphics("vignettes_img/IMG05.png")

