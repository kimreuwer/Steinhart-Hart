#dataset is named 
#theoretically read in a file 

stwd(/Folder/Location)
#wherever your R-directory is

read.csv("NTCThermistor_File.csv")
#this is more for me, but NTC = negative temperature coefficient
ntt<-read.csv("NTCThermistor_File.csv")

head(ntt)
#shows the head of a dataset, with the [,1] named Resistance, [,2] named Temp.C 

ntt$yax<- 1/nff$Temp.C

#this stores 1 over the values in column Temp.C [,2] into a new column [,3] in the dataset
#storing nff$Temp.C as a variable also works 
#so, T<-nff$Temp.C 
#then nff$yax<- 1/T
#Whatever suits you 
#1/Temp is on the yaxis because 

ntt$xax<-log(Resistance)
ntt$R3<- (xax)^3

SHH = lm(yax) ~ (xax)+(R3))
#Steinhart-Hart = a linear model of (1/Temp) by natural log of resistance by the natural log of resistance cubed
#this is a modified slope equation - temperature is in the denominator because the equation is cubed, meaning it will not naturally linearly form
summary(SHH)
#should produce the coefficients // constant for your thermistor

plot(xax, yax, data = ntt, ylab ="1 / Temperature (C)", xlab = "Natural Log Resistance (kOhm)", main = "Steinhart-Hart")
legend("topright",c("A=0.04282", "B=-0.02254", "C=0.00405"))
#these were my coefficients
abline(lm(yax~xax))
#displays a line of best fit
mtext("1/T = A + Bln(R)+C(ln(R))^3)")
#displays the equation underneath the main title


#R seems friendlier IF a . or symbol is in the column name, use plot(data$colu.mn~data$column)
#instead of plot(colu.mn, column, data = data)

