############## LDlink ##############

# Create LD SNP list from your original data
# First step is to create working directory
setwd("C:/SANDEEP/MAIN/CAREER/My_papers/PAPERS_in_PROGRESS/AGE_ALL/ALL_AGE_DATA_NEW/LDlink_results")
library(data.table)
# rs202050948, rs9728577 and rs75411676 data is not in  1000 genome, hence will analyzed later
snps <- fread("C:/SANDEEP/MAIN/CAREER/My_papers/PAPERS_in_PROGRESS/AGE_ALL/Top_100_P_value.txt",
              header = FALSE)
library(LDlinkR)
LDproxy_batch(snp = snps,
              token = Sys.getenv("LDLINK_TOKEN")
              )
# reading downloaded files
list_of_files <- list.files(path = ".", recursive = TRUE,
                            pattern = "\\.txt",
                            full.names = TRUE)

library(tidyverse)
df <- list_of_files %>%
  set_names(.) %>%
  map_df(read_table2, .id = "FileName")

head(df)

Age_ALL <- df %>% 
  select(-RS_Number, -Alleles, -MAF, -Distance, -Dprime, -R2, -RegulomeDB) %>% 
  rename(LD_SNP = "Coord", RegulomeDB = "Function", R2 = "Correlated_Alleles") %>% 
  filter(R2 >=0.8) %>% 
  separate(FileName, c("v1", "SNP"), sep = 2) %>% 
  separate(SNP, c("SNP", "v2")) %>% 
  select(-v1, -v2) %>% 
  distinct(LD_SNP, .keep_all = TRUE)

write.table(Age_ALL, file = "C:/SANDEEP/MAIN/CAREER/My_papers/PAPERS_in_PROGRESS/AGE_ALL/ALL_AGE_DATA_NEW/AGE_ALL_LDlink.txt",
            row.names = FALSE,
            col.names = TRUE,
            sep = "\t",
            quote = FALSE)

