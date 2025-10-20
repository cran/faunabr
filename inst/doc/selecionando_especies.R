## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE,
  warning = FALSE
)

## -----------------------------------------------------------------------------
# library(faunabr)
# #Carregar dados
# bf <- load_faunabr(data_dir = my_dir, #Pasta onde foi salvo o arquivo com get_faunabr()
#                    data_version = "latest", #Versão mais recente
#                    type = "short") #Versão resumida
# #> Loading version 1.3

## -----------------------------------------------------------------------------
# #Obter as opções disponíveis para filtrar por forma de vida, habitat e origem
# fauna_at <- fauna_attributes(data = bf,
#                              attribute = c("lifeForm", "habitat", "origin"))
# head(fauna_at$lifeForm)
# #>          lifeForm
# #> 1        colonial
# #> 2       comensal
# #> 3    ectoparasito
# #> 4 ectoparasitoide
# #> 5    endoparasito
# #> 6  endoparasitoide
# 
# head(fauna_at$habitat)
# #> habitat
# #> 1          agua_doce
# #> 2 aguas_subterraneas
# #> 3            arboreo
# #> 4        cavernicola
# #> 5          fossorial
# #> 6         hiporreico
# 
# head(fauna_at$origin)
# #>         origin
# #> 1 criptogenica
# #> 2      exotica
# #> 3       nativa

## -----------------------------------------------------------------------------
# insects_rj <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Insetos
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "arboreo", filter_habitat = "in",
#                            states = "RJ", #Rio de Janeiro
#                            filter_states = "in", #Que ocorrem NO RJ
#                            country = "all", filter_country = "in",
#                            origin = "nativa",
#                            taxonomicStatus = "valido")
# nrow(insects_rj)
# #> [1] 114

## -----------------------------------------------------------------------------
# #Primeiros 7 valores únicos de Estados onde as espécies ocorrem
# unique(insects_rj$states)[1:7]
# #> [1] "AC;AM;AP;BA;CE;DF;ES;GO;MA;MG;MS;MT;PA;PE;RJ;RN;RO;RR;SE;SP;TO"
# #> [2] "BA;MA;MG;MT;PR;RJ;RS;SC;SP"
# #> [3] "ES;MG;PE;PR;RJ;RS;SP"
# #> [4] "ES;PR;RJ;SP"
# #> [5] "RJ"
# #> [6] "RJ;SP"
# #> [7] "ES;MG;RJ;RS;SC;SP"

## -----------------------------------------------------------------------------
# insects_rj_only <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Insetos
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "arboreo", filter_habitat = "in",
#                            states = "RJ", #Rio de Janeiro
#                            filter_states = "only", #Com ocorrência APENAS no RJ
#                            country = "all", filter_country = "in",
#                            origin = "nativa",
#                            taxonomicStatus = "valido")
# nrow(insects_rj_only)
# #> [1] 22
# unique(insects_rj_only$states)
# #> [1] "RJ"

## -----------------------------------------------------------------------------
# insects_south <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Insetos
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = c("PR", "SC", "RS"), #Estados do Sul do Brasil
#                            filter_states = "in", #EM qualquer um dos estados
#                            country = "all", filter_country = "in",
#                            origin = "nativa",
#                            taxonomicStatus = "valido")
# nrow(insects_south)
# #> [1] 11461
# 
# #Primeiros 10 valores únicos de Estados onde as espécies ocorrem
# unique(insects_south$states)[1:10]
# #> [1] "PR;SP"
# #> [2] "BA;MT;RJ;RS"
# #> [3] "RS"
# #> [4] "PR"
# #> [5] "PR;RS"
# #> [6] "GO;PA;RO;RR;SC"
# #> [7] "MG;PR;SP"
# #> [8] "GO;MG;PR;RS;SC"
# #> [9] "GO;RJ;SC"
# #> [10] "AC;AL;AM;AP;BA;CE;DF;ES;GO;MA;MG;MS;MT;PA;PB;PE;PI;PR;RJ;RN;RO;RR;RS;SC;SE;SP;TO"

## -----------------------------------------------------------------------------
# insects_south_and <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Insetos
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = c("PR", "SC", "RS"),
#                            filter_states = "and", #PR & SC & RS
#                            country = "all", filter_country = "in",
#                            origin = "nativa",
#                            taxonomicStatus = "valido")
# nrow(insects_south_and)
# #> [1] 1924
# 
# #Primeiros 10 valores únicos de Estados onde as espécies ocorrem
# unique(insects_south_and$states)[1:10]
# #> [1] "GO;MG;PR;RS;SC"
# #> [2] "AC;AL;AM;AP;BA;CE;DF;ES;GO;MA;MG;MS;MT;PA;PB;PE;PI;PR;RJ;RN;RO;RR;RS;SC;SE;SP;TO"
# #> [3] "AC;AM;MG;MS;MT;PA;PE;PR;RO;RS;SC;SP"
# #> [4] "AM;BA;CE;DF;ES;GO;MG;MS;MT;PA;PE;PR;RJ;RS;SC;SP"
# #> [5] "AC;AM;AP;BA;CE;DF;ES;GO;MG;MS;MT;PA;PE;PR;RJ;RO;RR;RS;SC;SE;SP;TO"
# #> [6] "BA;ES;MG;PR;RJ;RS;SC;SP"
# #> [7] "AM;DF;ES;GO;PR;RJ;RR;RS;SC;SP"
# #> [8] "ES;GO;MG;PR;RJ;RS;SC;SP"
# #> [9] "AC;AM;AP;BA;CE;ES;GO;MA;MG;MT;PA;PR;RJ;RO;RS;SC;SP;TO"
# #> [10] "GO;MG;MS;PR;RO;RS;SC;SP"

## -----------------------------------------------------------------------------
# insects_south_only <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Insetos
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = c("PR", "SC", "RS"),
#                            filter_states = "only", #Apenas no PR & SC & RS
#                            country = "all", filter_country = "in",
#                            origin = "nativa",
#                            taxonomicStatus = "valido")
# nrow(insects_south_only)
# #> [1] 134
# 
# #Valor único de Estados onde as espécies ocorrem
# unique(insects_south_only$states)
# #> [1] "PR;RS;SC"

## -----------------------------------------------------------------------------
# complete_names <- c("Pantera onca (Linnaeus, 1758)",
#                     "Zonotrichia capensis subtorquata Swainson, 1837",
#                     "Mazama bororo Duarte, 1996",
#                     "Mazama jucunda Thomas, 1913",
#                     "Arrenurus tumulosus intercursor",
#                     "Araucaria angustifolia")
# #Panthera onca com erros de digitação para ilustrar como a próxima função os corrige
# #Araucaria angustifolia (uma planta) foi usada apenas como um exemplo que será utilizado para ilustrar a próxima função
# binomial_names <- extract_binomial(species_names = complete_names)
# binomial_names
# #> [1] "Pantera onca"                         "Zonotrichia capensis"
# #> [3] "Mazama bororo"                        "Mazama jucunda"
# #> [5] "Arrenurus tumulosus"                  "Araucaria angustifolia"

## -----------------------------------------------------------------------------
# #Checar nomes
# checked_names <- check_fauna_names(data = bf,
#                              species = binomial_names,
#                              include_subspecies = FALSE,
#                              max_distance = 0.1)
# tibble::tibble(checked_names) #Exibir tabela como tibble
# #> # A tibble: 6 x 9
# #>   input_name               Spelling           Suggested_name       Distance taxonomicStatus nomenclaturalStatus validName   family        matches
# #>   <chr>                    <chr>              <chr>                   <dbl> <chr>           <chr>               <chr>          <chr>         <chr>
# #> 1 "Zonotrichia capensis"   Correct            Zonotrichia capensis        0 valido    NA                  NA             Passerellidae single
# #> 2 "Mazama bororo"          Correct            Mazama bororo               0 sinonimo        NA                  Mazama jucunda Cervidae      single
# #> 3 "Mazama jucunda"         Correct            Mazama jucunda              0 valido     NA                  NA             Cervidae      single
# #> 4 "Arrenurus tumulosus"    Correct            Arrenurus tumulosus         0 valido     NA                  NA             Arrenuridae   single
# #> 5 "Pantera onca"           Probably_incorrect Panthera onca               2 valido     NA                  NA             Felidae       single
# #> 6 "Araucaria angustifolia" Not_found          NA                         NA NA              NA                  NA             NA            none

## -----------------------------------------------------------------------------
# #Obter apenas nomes validos
# valids <- unique(checked_names$validName)
# valids <- na.omit(valids) #Remove NAs
# 
# #Subselecionar especies
# my_sp <- subset_fauna(data = bf, species = valids,
#                       include_subspecies = FALSE)
# tibble::tibble(my_sp)
# # A tibble: 4 x 21
# #>   species           subspecies scientificName validName kingdom phylum class order family genus lifeForm habitat states countryCode origin
# #>   <chr>             <chr>      <chr>          <chr>        <chr>   <chr>  <chr> <chr> <chr>  <chr> <chr>    <chr>   <chr>  <chr>       <chr>
# #> 1 Panthera onca     NA         Panthera onca~ NA           Animal~ Chord~ Mamm~ Carn~ Felid~ Pant~ "vida_l~ "terre~ AC;AM~ AR;BO;BR;B~ nativa
# #> 2 Arrenurus tumulo~ NA         Arrenurus (In~ NA           Animal~ Arthr~ Arac~ Trom~ Arren~ Arre~ ""       ""      NA     NA          NA
# #> 3 Mazama jucunda    NA         Mazama jucund~ NA           Animal~ Chord~ Mamm~ Arti~ Cervi~ Maza~ "herbiv~ "terre~ BA;ES~ BR          nativa
# #> 4 Zonotrichia cape~ NA         Zonotrichia c~ NA           Animal~ Chord~ Aves  Pass~ Passe~ Zono~ ""       ""      NA     NA          nativa
# # i 5 more variables: nomenclaturalStatus <chr>, vernacularName <chr>, taxonRank <chr>, id <int>, language <chr>

## -----------------------------------------------------------------------------
# my_sp2 <- subset_fauna(data = bf, species = valids,
#                       include_subspecies = TRUE)
# tibble::tibble(my_sp2) #print data.frame as tibble
# #> # A tibble: 14 × 19
# #>    species      subspecies scientificName validName kingdom phylum class order family genus lifeForm habitat states countryCode #> origin
# #>    <chr>        <chr>      <chr>          <chr>        <chr>   <chr>  <chr> <chr> <chr>  <chr> <chr>    <chr>   <chr>  <chr>       #> <chr>
# #>  1 Panthera on… ""         Panthera onca… ""           Animal… Chord… Mamm… Carn… Felid… Pant… "free_l… "terre… AC;AM… argentina;… #> "nati…
# #>  2 Arrenurus (… ""         Arrenurus (In… ""           Animal… Arthr… Arac… Trom… Arren… Arre… ""       ""      NA     brazil      "" #>
# #>  3 Arrenurus (… "Arrenuru… Arrenurus (In… ""           Animal… Arthr… Arac… Trom… Arren… Arre… ""       ""      NA     brazil      "" #>
# #>  4 Arrenurus (… "Arrenuru… Arrenurus (In… ""           Animal… Arthr… Arac… Trom… Arren… Arre… ""       ""      NA     brazil      "" #>
# #>  5 Mazama jucu… ""         Mazama jucund… ""           Animal… Chord… Mamm… Arti… Cervi… Maza… "herbiv… "terre… BA;ES… brazil      #> "nati…
# #>  6 Zonotrichia… ""         Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      AL;AP… brazil      #> "nati…
# #>  7 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      AP     brazil      #> "nati…
# #>  8 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      RR     brazil      #> "nati…
# #>  9 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      RR     brazil      #> "nati…
# #> 10 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      BA;MA… brazil      #> "nati…
# #> 11 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      PA     brazil      #> "nati…
# #> 12 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      AP;PA… brazil      #> "nati…
# #> 13 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      ES;MG… brazil      #> "nati…
# #> 14 Zonotrichia… "Zonotric… Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      TO     brazil      #> "nati…
# #> # ℹ 4 more variables: taxonomicStatus <chr>, nomenclaturalStatus <chr>, vernacularName <chr>, taxonRank <chr>
# #>

## -----------------------------------------------------------------------------
# spp <- c("Panthera onca", "Mazama jucunda", "Subulo gouzoubira")
# spp_syn <- fauna_synonym(data = bf, species = spp)
# spp_syn
# #>               validName               synonym   taxonomicStatus
# #> 49343     Panthera onca                  <NA>    valido
# #> 60523    Mazama jucunda         Mazama bororo    sinonimo
# #> 61168 Subulo gouzoubira    Mazama gouazoubira    sinonimo

