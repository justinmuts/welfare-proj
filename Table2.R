#### Taxation statistics 2015-16 Individuals: Number of individuals, by state/territory, postcode and taxable income range, 2015-16 income year (Table 2)

library(readxl)
library(httr)
library(dplyr)
library(tidyr)

url6 <- "https://data.gov.au/dataset/d170213c-4391-4d10-ac24-b0c11768da3f/resource/8c86b6d5-0485-4387-b12b-ad26a9da2033/download/taxstats2016individual06taxablestatusstateterritorypostcodetaxableincome.xlsx"
p6f <- tempfile()

GET(url6, write_disk(tf6 <- tempfile(fileext = ".xlsx")))

IncomeRange2016 <- as.data.frame(read_excel(tf6, sheet = 4, col_names = TRUE, skip = 2))

IncomeRange2016[IncomeRange2016=="na"]<-0

table2 <- IncomeRange2016%>%mutate(`d. $80,001 to $180,000`= as.numeric(IncomeRange2016$`d. $80,001 to $180,000`),
                                            `e. $180,000 or more`= as.numeric(IncomeRange2016$`e. $180,000 or more`), 
                                            `f. $80,001 or more`= as.numeric(IncomeRange2016$`f. $80,001 or more`))


str(table2)
