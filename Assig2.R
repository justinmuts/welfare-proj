library(readxl)
library(httr)
library(dplyr)



### Year 2012

url <- "https://data.gov.au/dataset/95d9e550-8b36-4273-8df7-2b76c140e73a/resource/f16ba84c-88b8-4598-b961-6a645302f220/download/taxstats2012individual06selecteditemsbytaxablestatusstateandpostcode.xlsx"
pf <- tempfile()

GET(url, write_disk(tf <- tempfile(fileext = ".xlsx")))

T2012 <- as.data.frame(read_excel(tf, sheet = 2, col_names = TRUE, skip = 2))


T2012 <- T2012%>%select("Taxable status","State/Territory1", "Postcode", "Number of individuals\r\nno.", "Number of people with private health insurance\r\nno.","Taxable income or loss3\r\nno.", "Taxable income or loss3\r\n$", "Gross interest\r\n$", 
                        "Australian government allowances and payments\r\n$", "Australian government allowances and payments\r\nno.")

colnames(T2012) <- c("status","State", "PostCode", "Population", "NoPeopleHI","NoPeople", "Income", "Interest", "Allowances", "NoAllowances")


T2012 <- T2012%>%group_by(State, PostCode)%>% 
        summarize(Population = sum(Population), NoPeopleHI = sum(NoPeopleHI), NoPeople = sum(NoPeople), Income = sum(Income), Interest = sum(Interest), Allowances = sum(Allowances), NoAllowances = sum(NoAllowances))


rep2012 <- rep("2012", length(30))


T2012 <- as.data.frame(T2012%>%mutate(Year = rep2012, PostCode = as.character(PostCode)))



### Year 2013

url2 <- "https://data.gov.au/dataset/e29ef9ca-0d1a-47ec-9e9b-14a79a941511/resource/fa6fda82-a70d-4f4c-bb00-203ffc4d20af/download/taxstats2013individual06selected-items-by-taxable-status-postcode.xlsx"
p2f <- tempfile()

GET(url2, write_disk(tf2 <- tempfile(fileext = ".xlsx")))

T2013 <- as.data.frame(read_excel(tf2, sheet = 3, col_names = TRUE, skip = 2))


T2013 <- T2013%>%select("State/Territory1", "Postcode", "Number of individuals\r\nno.", "Number of individuals with private health insurance no.","Taxable income or loss\r\nno.", "Taxable income or loss\r\n$", "Gross interest\r\n$", 
"Australian Government allowances and payments like newstart, youth allowance and austudy payment\r\n$", "Australian Government allowances and payments like newstart, youth allowance and austudy payment\r\nno.")

colnames(T2013) <- c("State", "PostCode", "Population", "NoPeopleHI","NoPeople", "Income", "Interest", "Allowances", "NoAllowances")

rep2013 <- rep("2013", length(T2013$State))

T2013 <- T2013%>%mutate(Year = rep2013)



### Year 2014

url3 <- "https://data.gov.au/dataset/25e81c18-2083-4abe-81b6-0f530053c63f/resource/942c9a30-baf2-4432-9513-1395fbef7edf/download/taxstats2014individual06taxablestatuspostcode.xlsx"
p3f <- tempfile()

GET(url3, write_disk(tf3 <- tempfile(fileext = ".xlsx")))

T2014 <- as.data.frame(read_excel(tf3, sheet = 2, col_names = TRUE, skip = 2))




T2014 <- T2014%>%select("State/Territory1", "Postcode", "Number of individuals", "Number of individuals with private health insurance","Taxable income or loss3\r\nno.", "Taxable income or loss3\r\n$", "Gross interest\r\n$", 
                        "Australian government allowances and payments\r\n$", "Australian government allowances and payments\r\nno.")


colnames(T2014) <- c("State", "PostCode", "Population", "NoPeopleHI","NoPeople", "Income", "Interest", "Allowances", "NoAllowances")

T2014 <- T2014%>%group_by(State, PostCode)%>% 
  summarize(Population = sum(Population), NoPeopleHI = sum(NoPeopleHI), NoPeople = sum(NoPeople), Income = sum(Income), Interest = sum(Interest), Allowances = sum(Allowances), NoAllowances = sum(NoAllowances))


rep2014 <- rep("2014", length(25))


T2014 <- as.data.frame(T2014%>%mutate(Year = rep2014, PostCode = as.character(PostCode)))



### Year 2015

url4 <- "https://data.gov.au/dataset/5c99cfed-254d-40a6-af1c-47412b7de6fe/resource/12443334-2273-4e0f-a2e1-c9d0c1d8213b/download/taxstats2015individual06taxablestatusstateterritorypostcode.xlsx"
p4f <- tempfile()

GET(url4, write_disk(tf4 <- tempfile(fileext = ".xlsx")))

T2015 <- as.data.frame(read_excel(tf4, sheet = 3, col_names = TRUE, skip = 2))



T2015 <- T2015%>%select("State/ Territory1", "Postcode", "Number of individuals\r\nno.", "People with private health insurance\r\nno.","Taxable income or loss3\r\nno.", "Taxable income or loss3\r\n$", "Gross interest\r\n$", 
                        "Australian government allowances and payments\r\n$", "Australian government allowances and payments\r\nno.")


colnames(T2015) <- c("State", "PostCode", "Population", "NoPeopleHI","NoPeople", "Income", "Interest", "Allowances", "NoAllowances")

rep2015 <- rep("2015", length(T2015$State))

T2015 <- T2015%>%mutate(Year = rep2015)


### Year 2016

url5 <- "https://data.gov.au/dataset/d170213c-4391-4d10-ac24-b0c11768da3f/resource/8c86b6d5-0485-4387-b12b-ad26a9da2033/download/taxstats2016individual06taxablestatusstateterritorypostcodetaxableincome.xlsx"
p5f <- tempfile()

GET(url5, write_disk(tf5 <- tempfile(fileext = ".xlsx")))

T2016 <- as.data.frame(read_excel(tf5, sheet = 3, col_names = TRUE, skip = 2))



T2016 <- T2016%>%select("State/ Territory1", "Postcode", "Number of individuals\r\nno.", "People with private health insurance \r\nno.","Taxable income or loss3 \r\nno.", "Taxable income or loss3 \r\n$", "Gross interest \r\n$", 
                        "Australian government allowances and payments \r\n$", "Australian government allowances and payments \r\nno.")


colnames(T2016) <- c("State", "PostCode", "Population", "NoPeopleHI","NoPeople", "Income", "Interest", "Allowances", "NoAllowances")

rep2016 <- rep("2016", length(T2016$State))

T2016 <- T2016%>%mutate(Year = rep2016)


#### Consolidation all years in one Table

main <- rbind(T2012, T2013, T2014, T2015, T2016)

head(main)

str(main)











