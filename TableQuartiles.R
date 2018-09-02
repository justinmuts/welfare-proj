### JACKY'S Enquiry for the average income divided by 4 quartiles
#REQUIRED YOU NEED TO RUN TABLE 1 R SCRIPT FIRST

# the quantiles from table 1 are as follows:

# 25% quantile is average income up to $41,802.37;

# 50% quantile is average income greater than $41,802.37 and less than equal to $48,328.35;

# 75% quantile is average income greater than $48,328.35 and less than equal to $57,774.44;

# 75% and over quantile is over $57,774.44




#copying table1 and name it table1.1 and calculating the average income per postcode

table1.1 <-mutate(table1,avginc=Income/Population)

table1.1

View(table1.1)

# Finding 25%, 50% and 75% quantiles from the average income column (avginc)

quantile(table1.1$avginc, probs = c(0.25, 0.50, 0.75))

#The Results are below:

#25%      50%      75% 
#41802.37 48328.35 57774.44 


#The first 25% quantile
IQR25 <- filter(table1.1,avginc<=41802.37)

# Rename avginc column to IQR25 in dataframe IQR25
colnames(IQR25)[colnames(IQR25)=="avginc"] <- "IQR25"

View(IQR25)

# The 50% quantile

IQR50 <- filter(table1.1,avginc > 41802.37 & avginc<= 48328.35)

str(IQR50)

View(IQR25)

# Rename avginc column to IQR50 in dataframe IQR50
colnames(IQR50)[colnames(IQR50)=="avginc"] <- "IQR50"

str(IQR50)

View(IQR50)

#The 75% quantile
IQR75<- filter(table1.1,avginc>48328.35 & avginc <=57774.44)

str(IQR75)

View(IQR75)

# Rename avginc column to IQR75 in dataframe IQR75
colnames(IQR75)[colnames(IQR75)=="avginc"] <- "IQR75"


View(IQR75)

#IQR over 75%
IQR_over75 <- filter(table1.1,avginc>57774.44)

IQR_over75

# Rename a column in R
colnames(IQR_over75)[colnames(IQR_over75)=="avginc"] <- "IQR_over75"

View(IQR_over75)

#create another table just in case of a mistake
table1.2 <- table1.1
View(table1.2)

#outerjoin 25
q1 <- merge(table1.2,IQR25, by=c("State","PostCode","Income"), all=T)
head(q1,n=5)
View(q1)
#Remove unwanted columns
colnames(q1)
q1 <- select(q1,-(12:18))
q1

#outerjoin 50
q1 <- merge(q1,IQR50, by=c("State","PostCode","Income"), all=T)
head(q1,n=5)
View(q1)

#Remove unwanted columns
colnames(q1)
q1 <- select(q1,-(13:19))
q1

#outerjoin 75
q1 <- merge(q1,IQR75, by=c("State","PostCode","Income"), all=T)
head(q1,n=5)
View(q1)
colnames(q1)
#Remove unwanted columns
q1 <- select(q1,-(14:20))
q1


#outerjoin over 75
q1 <- merge(q1,IQR_over75, by=c("State","PostCode","Income"), all=T)
head(q1,n=5)
View(q1)
colnames(q1)
#Remove unwanted columns
q1 <- select(q1,-(15:21))
q1

#remove na
q1[is.na(q1)]<-0


