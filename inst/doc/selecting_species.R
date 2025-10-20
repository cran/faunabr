## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE,
  warning = FALSE
)

## -----------------------------------------------------------------------------
# library(faunabr)
# #Folder where you stored the data with the function get_faunabr()
# #Load data
# bf <- load_faunabr(data_dir = my_dir,
#                    data_version = "latest",
#                    type = "short") #short version
# #> Loading version 1.3

## -----------------------------------------------------------------------------
# #Get available options to filter by lifeForm, habitat and origin
# fauna_at <- fauna_attributes(data = bf,
#                              attribute = c("lifeForm", "habitat", "origin"))
# head(fauna_at$lifeForm)
# #>          lifeForm
# #> 1        colonial
# #> 2       commensal
# #> 3    ectoparasite
# #> 4 ectoparasiteIDE
# #> 5    endoparasite
# #> 6  endoparasiteid
# 
# head(fauna_at$habitat)
# #>         habitat
# #> 1      arboreal
# #> 2 cavernicolous
# #> 3     fossorial
# #> 4    freshwater
# #> 5     hyporheic
# #> 6        marine
# 
# head(fauna_at$origin)
# #>         origin
# #> 1  cryptogenic
# #> 2 domesticated
# #> 3   introduced
# #> 4     invasive
# #> 5       native

## -----------------------------------------------------------------------------
# insects_rj <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Select insecs
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "arboreal", filter_habitat = "in",
#                            states = "RJ", #Rio de Janeiro
#                            filter_states = "in", #Select IN Rio de Janeiro
#                            country = "all", filter_country = "in",
#                            origin = "native",
#                            taxonomicStatus = "valid")
# nrow(insects_rj)
# #> [1] 114

## -----------------------------------------------------------------------------
# #First 7 unique values of states in the filtered dataset
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
#                            class = "Insecta", #Select insecs
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "arboreal", filter_habitat = "in",
#                            states = "RJ", #Rio de Janeiro
#                            filter_states = "only", #Select ONLY in Rio de Janeiro
#                            country = "all", filter_country = "in",
#                            origin = "native",
#                            taxonomicStatus = "valid")
# nrow(insects_rj_only)
# #> [1] 22
# unique(insects_rj_only$states)
# #> [1] "RJ"

## -----------------------------------------------------------------------------
# insects_south <- select_fauna(data = bf, include_subspecies = FALSE,
#                            phylum = "all",
#                            class = "Insecta", #Select insecs
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = c("PR", "SC", "RS"), #States from southern Brazil
#                            filter_states = "in", #IN any of these states
#                            country = "all", filter_country = "in",
#                            origin = "native",
#                            taxonomicStatus = "valid")
# nrow(insects_south)
# #> [1] 11461
# 
# #First 10 unique values of states in the filtered dataset
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
#                            class = "Insecta", #Select insecs
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = c("PR", "SC", "RS"), #States from southern Brazil
#                            filter_states = "and", #in PR AND SC AND RS
#                            country = "all", filter_country = "in",
#                            origin = "native",
#                            taxonomicStatus = "valid")
# nrow(insects_south_and)
# #> [1] 1924
# 
# #First 10 unique values of states in the filtered dataset
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
#                            class = "Insecta", #Select insecs
#                            order = "all",
#                            family = "all",
#                            genus = "all",
#                            lifeForm = "all", filter_lifeForm = "in",
#                            habitat = "all", filter_habitat = "in",
#                            states = c("PR", "SC", "RS"), #States from southern Brazil
#                            filter_states = "only", #ONLY in PR, SC and RS
#                            country = "all", filter_country = "in",
#                            origin = "native",
#                            taxonomicStatus = "valid")
# nrow(insects_south_only)
# #> [1] 134
# 
# #The unique state in the filtered dataset
# unique(insects_south_only$states)
# #> [1] "PR;RS;SC"

## -----------------------------------------------------------------------------
# complete_names <- c("Pantera onça (Linnaeus, 1758)",
#                     "Zonotrichia capensis subtorquata Swainson, 1837",
#                     "Mazama bororo Duarte, 1996",
#                     "Mazama jucunda Thomas, 1913",
#                     "Arrenurus tumulosus intercursor",
#                     "Araucaria angustifolia")
# #Panthera onca with typos to illustrate how the next function corrects it
# #Araucaria angustifolia (a Plant) was used just as an example that will be used to illustrate the
# #next function
# binomial_names <- extract_binomial(species_names = complete_names)
# binomial_names
# #> [1] "Pantera onça"                         "Zonotrichia capensis"
# #> [3] "Mazama bororo"                        "Mazama jucunda"
# #> [5] "Arrenurus tumulosus"                  "Araucaria angustifolia"

## -----------------------------------------------------------------------------
# #Create example
# checked_names <- check_fauna_names(data = bf,
#                              species = binomial_names,
#                              include_subspecies = FALSE,
#                              max_distance = 0.1)
# tibble::tibble(checked_names) #print data.frame as tibble
# #> # A tibble: 6 × 8
# #>   input_name           Spelling Suggested_name Distance taxonomicStatus validName #> family
# #>   <chr>                <chr>    <chr>             <dbl> <chr>           <chr>        #> <chr>
# #> 1 Zonotrichia capensis Correct  Zonotrichia c…        0 valid   Zonotrichia… #> Passe…
# #> 2 Mazama bororo        Correct  Mazama bororo         0 synonym         Mazama jucu… #> Cervi…
# #> 3 Mazama jucunda       Correct  Mazama jucunda        0 valid   Mazama jucu… #> Cervi…
# #> 4 Arrenurus (Incertae… Correct  Arrenurus tum…        0 valid   Arrenurus t… #> Arren…
# #> 5 Pantera onça         Probabl… Panthera onca         2 valid   Panthera on… #> Felid…
# #> 6 Araucaria angustifo… Not_fou… NA                   NA NA              NA           NA
# 

## -----------------------------------------------------------------------------
# #Get only valid names
# valids <- unique(checked_names$validName)
# valids <- na.omit(valids) #Remove NA
# 
# #Subset species
# my_sp <- subset_fauna(data = bf, species = valids,
#                       include_subspecies = FALSE)
# tibble::tibble(my_sp) #print data.frame as tibble
# #> # A tibble: 4 × 19
# #>   species       subspecies scientificName validName kingdom phylum class order family genus lifeForm habitat states countryCode #> origin
# #>   <chr>         <chr>      <chr>          <chr>        <chr>   <chr>  <chr> <chr> <chr>  <chr> <chr>    <chr>   <chr>  <chr>       #> <chr>
# #> 1 Panthera onca ""         Panthera onca… ""           Animal… Chord… Mamm… Carn… Felid… Pant… "free_l… "terre… AC;AM… argentina;… #> "nati…
# #> 2 Arrenurus (I… ""         Arrenurus (In… ""           Animal… Arthr… Arac… Trom… Arren… Arre… ""       ""      NA     brazil      ""
# #> 3 Mazama jucun… ""         Mazama jucund… ""           Animal… Chord… Mamm… Arti… Cervi… Maza… "herbiv… "terre… BA;ES… brazil      #> "nati…
# #> 4 Zonotrichia … ""         Zonotrichia c… ""           Animal… Chord… Aves  Pass… Passe… Zono… "free_l… ""      AL;AP… brazil      #> "nati…
# #> # ℹ 4 more variables: taxonomicStatus <chr>, nomenclaturalStatus <chr>, vernacularName <chr>, taxonRank <chr>

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
# #>           validName               synonym        taxonomicStatus
# #> 49343     Panthera onca                  <NA>             valid
# #> 60523    Mazama jucunda         Mazama bororo             synonym
# #> 61168 Subulo gouzoubira    Mazama gouazoubira             synonym

