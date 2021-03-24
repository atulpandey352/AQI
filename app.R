setwd("D:/R-4.0.3/bin")
download.file("https://file-examples-com.github.io/uploads/2017/02/file_example_XLSX_5000.xlsx",destfile ="mama2.xlsx", mode= 'wb')
install.packages("xlsx")
install.packages("ggplot2")
library(xlsx)
library(ggplot2)
library(dplyr)
list.files()
mama<-read.xlsx("mama2.xlsx",sheetIndex=1)
head(mama)
str(mama)
dim(mama)
mama['AGECAT']<-character(0)


mama[mama[,6]<=40,9]="young"
mama[is.na(mama$AGECAT),9]="old"
#mama$Date<-strptime(mama$Date,format="%d/%m/%Y")

#####################plotting
class(mama$Date)
mama$Date<-as.Date(mama$Date,fromat="%d/%m/%Y")
#as.POSIXlt(mama$Date,format = "",tryFormats = c("%d-%m-%Y", "%d/%m/%Y"))
ggplot(mama,aes(x=Date,y=Age))+geom_point(col=count(AGECA
                                                    T)
#
grph<-mama %>% group_by(Country) %>% summarize(YOUNG= count(which(AGECAT=="young")),OLD = count(which(mama$AGECAT=="old")))
mama$AGECAT<-factor(mama$AGECAT)
mama$Country<-factor(mama$Country)
levels(mama$Country)
ggplot(mama,aes(x=AGECAT,y=count(AGECAT),fill=AGECAT))+ geom_bar(stat = "identity")+ facet_wrap(mama$Country) + theme_minimal()
n<-m+labs(x="AGE CATEGORY" , y="TOTAL" , title = "COUNTRYWISE AGE GROUP")
n+ theme(plot.title = element_text(hjust = 0.5))       

mama%>% group_by(Country) %>% summarise(OLD=sum((AGECAT=="old")),YOUNG=sum(AGECAT=="young"))

ggplot(mama,aes(fill=AGECAT,x=Country))+ geom_bar(stat="count",position = "dodge")
