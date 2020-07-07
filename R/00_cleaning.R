

##### DimCustomer -----
### ns 20202/7/7
library("dplyr")
library("lubridate")
z <- read.csv2(file = "./data/sgsc-ct_customer-household-data-revised.csv", ## DimCustomer
               header = T, sep = ",", check.names = T, stringsAsFactors = F)

## Exmplore:
(z <- tibble::as.tibble(z))
skimr::skim(z)
cn <- colnames(z)
table(z$TRIAL_CUSTOMER_TYPE) ## Possibly most useful variable.

dimCust <- mutate(z, .keep ="unused",
                  SMART_METER_INSTALLATION_DATE = 
                    strptime(z$SMART_METER_INSTALLATION_DATE, "%d-%b-%y"),
                  PROVISIONING_COMPLETE_DATE    = 
                    strptime(z$PROVISIONING_COMPLETE_DATE,    "%d-%b-%y"),
                  OPERATION_START_DATE          = 
                    strptime(z$OPERATION_START_DATE,          "%d-%b-%y"),
                  OPERATION_FINISH_DAT          = 
                    strptime(z$OPERATION_FINISH_DATE,         "%d-%b-%y"),)
dimCust <- select(dimCust, CUSTOMER_KEY, SERVICE_TYPE, SERVICE_LOC_STATUS_NAME, 
                  TRIAL_CUSTOMER_TYPE,
                  NUM_REFRIGERATORS,
                  NUM_ROOMS_HEATED,
                  HAS_GENERATION,
                  INFERRED_CELL)
save(dimCust, file = "./data/dimCust_ns20200707.rds")
### sessionInfo() ---
### as of 2020/07/07
# R version 4.0.0 (2020-04-24)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18362)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_Australia.1252  LC_CTYPE=English_Australia.1252   
# [3] LC_MONETARY=English_Australia.1252 LC_NUMERIC=C                      
# [5] LC_TIME=English_Australia.1252    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
# [1] lubridate_1.7.8 dplyr_1.0.0    
# 
# loaded via a namespace (and not attached):
# [1] Rcpp_1.0.4.6       rstudioapi_0.11    knitr_1.28         magrittr_1.5       tidyselect_1.1.0  
# [6] wordcloud_2.6      lattice_0.20-41    R6_2.4.1           rlang_0.4.6        skimr_2.1.1       
# [11] stringr_1.4.0      tools_4.0.0        statquotes_0.2.2   packrat_0.5.0      tidytext_0.2.4    
# [16] grid_4.0.0         xfun_0.15          janeaustenr_0.1.5  htmltools_0.5.0    ellipsis_0.3.1    
# [21] fortunes_1.5-4     digest_0.6.25      tibble_3.0.1       lifecycle_0.2.0    crayon_1.3.4      
# [26] Matrix_1.2-18      repr_1.1.0         purrr_0.3.4        RColorBrewer_1.1-2 base64enc_0.1-3   
# [31] vctrs_0.3.1        tokenizers_0.2.1   SnowballC_0.7.0    glue_1.4.1         stringi_1.4.6     
# [36] compiler_4.0.0     pillar_1.4.4       generics_0.0.2     jsonlite_1.7.0     pkgconfig_2.0.3   



