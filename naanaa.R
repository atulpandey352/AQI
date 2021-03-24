library(lubridate)
library(RSelenium)
library(tidyverse)
library(zoo)
library(httr)
library(jsonlite)
State=fromJSON("https://api.covid19india.org/data.json")
Sys.sleep(10)
delhigot<-State$statewise[6,4]
delhidead<-State$statewise[6,5]
delhirec<-State$statewise[6,6]
upgot<-State$statewise[7,4]
updead<-State$statewise[7,5]
uprec<-State$statewise[7,6]
dis=fromJSON("https://api.covid19india.org/state_district_wise.json")
Sys.sleep(10)
ayo<-dis$`Uttar Pradesh`$districtData$Ayodhya$delta$confirmed
sult<-dis$`Uttar Pradesh`$districtData$Sultanpur$delta$confirmed
gond<-dis$`Uttar Pradesh`$districtData$Gonda$delta$confirmed
luck<-dis$`Uttar Pradesh`$districtData$Lucknow$delta$confirmed
ghazi<-dis$`Uttar Pradesh`$districtData$Ghaziabad$delta$confirmed
basti<-dis$`Uttar Pradesh`$districtData$Basti$delta$confirmed
	delhi<-paste0("DELHI------------------",delhigot)
	upgot<-paste0("UP-------------------",upgot)
	ayo<-paste0("AYODHYA----------------",ayo)
	ghazi<-paste0("GHAZIABAD------------",ghazi)
	sult<-paste0("SULTANPUR-------------",sult)
	gond<-paste0("GONDA---------------",gond)
	luck<-paste0("LUCKNOW---------------",luck)
	basti<-paste0("BASTI------------------",basti)
rm(dis)
rm(State)

ver<-binman::list_versions("chromedriver")
version<-ver$win32[2]
port<-sample(4000:4999,1)
driver <- rsDriver(browser=c("chrome"),port,chromever=version)
remote_driver <- driver[["client"]]




remote_driver$navigate("https://web.whatsapp.com")
Sys.sleep(15)
##----------------FUNCTION----------------------------------------
covid<-function(contact){
	contact<-"+91 99711 14035"
	search<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "selectable-text", " " ))]')
	search$clearElement()
	search$sendKeysToElement(list(contact))
	Sys.sleep(3)
    if(contact=="+91 92107 21854"){
	remote_driver$maxWindowSize()
	Sys.sleep(5)
	remote_driver$mouseMoveToLocation(x=357,y=348)
	remote_driver$buttondown(buttonId = 0)
	Sys.sleep(5)
	}
	remote_driver$click(buttonId = 0)
	Sys.sleep(1)
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list("*TODAYS COVID UPDATE*", key = "enter"))
	nana$sendKeysToElement(list(upgot, key = "enter"))
	Sys.sleep(1)
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(ghazi, key = "enter"))
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(basti, key = "enter"))
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(ayo, key = "enter"))
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(gond, key = "enter"))
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(luck, key = "enter"))
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(sult, key = "enter"))
	nana<-remote_driver$findElement(value='//*[contains(concat( " ", @class, " " ), concat( " ", "_3uMse", " " ))]')
	nana$clickElement()
	nana$sendKeysToElement(list(delhi, key = "enter"))
}


##---------------CONTACT INFO----------------------------------------------

receiver<-numeric(0)
receiver[1]="+91 92107 21854"
receiver[2]="+91 98689 56683"
receiver[3]="+91 98993 53830"

receiver[4]="Shashank"
receiver[5]="+91 9971114035"
for(i in 1:length(receiver))
{
covid(receiver[i])
}



remote_driver$close()
rm(list=ls())


