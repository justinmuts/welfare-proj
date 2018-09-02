#### DSS Payment Demographic Data

library(readxl)
library(httr)
library(dplyr)
library(tidyr)



##Payment Demographic 2013

urldss0 <- "https://data.gov.au/dataset/cff2ae8a-55e4-47db-a66d-e177fe0ac6a0/resource/6b2343f4-09d3-4b03-a1fe-41897f710c6c/download/dssdemographicsdecember2013.xlsx"
p7 <- tempfile()

GET(urldss0, write_disk(tf7 <- tempfile(fileext = ".xlsx")))

dss2013 <- as.data.frame(read_excel(tf7, sheet = 7, col_names = TRUE, skip = 2))

d2013 <- rep("2013", length(dss2013$Postcode))

dss2013 <- dss2013%>%mutate(Year = 2013)

names2013 <- colnames(dss2013)




##Payment Demographic 2014

urldss1 <- "https://data.gov.au/dataset/cff2ae8a-55e4-47db-a66d-e177fe0ac6a0/resource/f0615bb3-463f-4352-902c-0b6bb0e22e7d/download/june-2014-dss-demographics-suppressed-2014-final-ftb.xlsx"
p8 <- tempfile()

GET(urldss1, write_disk(tf8 <- tempfile(fileext = ".xlsx")))

dss2014 <- as.data.frame(read_excel(tf8, sheet = 7, col_names = TRUE, skip = 2))

d2014 <- rep("2014", length(dss2014$Postcode))

dss2014 <- dss2014%>%mutate(Year = 2014)

colnames(dss2014) <- names2013

str(dss2014)


##Payment Demographic 2015


urldss2 <- "https://data.gov.au/dataset/cff2ae8a-55e4-47db-a66d-e177fe0ac6a0/resource/e6457899-378e-406f-8027-a6ee8a19eec6/download/dss-demographics-june-2015.xlsx"
p9 <- tempfile()

GET(urldss2, write_disk(tf9 <- tempfile(fileext = ".xlsx")))

dss2015 <- as.data.frame(read_excel(tf9, sheet = 9, col_names = TRUE, skip = 2))

d2015 <- rep("2015", length(dss2015$Postcode))

dss2015 <- dss2015%>%mutate(Year = 2015)

colnames(dss2015) <- names2013

str(dss2015)



##Payment Demographic 2016

urldss3 <- "https://data.gov.au/dataset/cff2ae8a-55e4-47db-a66d-e177fe0ac6a0/resource/829fc910-e263-4a59-ad33-1cd1159ce0df/download/dss-demographics-june-2016.xlsx"
p10 <- tempfile()

GET(urldss3, write_disk(tf10 <- tempfile(fileext = ".xlsx")))

dss2016 <- as.data.frame(read_excel(tf10, sheet = 9, col_names = TRUE, skip = 2))

d2016 <- rep("2016", length(dss2016$Postcode))

dss2016 <- dss2016%>%mutate(Year = d2016)

colnames(dss2016) <- names2013

str(dss2016)


### Consolidation Payment Demographic Table 3


PaymentDemographic<- rbind(dss2013,dss2014, dss2015, dss2016)

PaymentDemographic[PaymentDemographic=="<20"]<-10

PaymentDemographic[is.na(PaymentDemographic)] <- 0

PaymentDemographic[,2:29] <- sapply(PaymentDemographic[, 2:29], as.numeric)

table3 <- PaymentDemographic%>%mutate(Postcode = as.character(Postcode))

str(table3)
                                                  
                                                  



