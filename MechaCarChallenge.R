
#Part 1
library(tidyverse)

mpgData <- read.csv(file="MechaCar_mpg.csv",check.names=F, stringsAsFactors = F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpgData) 

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpgData))
#p-value 5.35e-11 rsquared .7149
## Linear Regression to Predict MPG
#need screen shot of output of Linear Regression
#The intercept, Vehicle Length, and Ground Clearance provided a non-random amount of variance
#The slope is considered non-zero because the p-value is 5.35e-11
#While this equation does provide a decent predictor, it is still lacking because the intercept provides a significant amount of the variance, meaning we are missing data.

#part 2
suspensionCoil <- read.csv(file="Suspension_Coil.csv", check.names=F, stringsAsFactors = F)
summary(suspensionCoil$PSI)
total_summary <- suspensionCoil %>% summarise(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI), SD=sd(PSI))
#class(total_summary)
lot_summary <- suspensionCoil %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups='keep')
## Summary Statistics on Suspension Coils
#screenshots of total_summary and lot_summary
#The variance of the whole indicates that it meets the 100lb per square inch variance limit, however Lot3 has a variance of 170+ so only Lot1 and 2 are good

#part 3
t.test(suspensionCoil$PSI, mu=1500)

t.test(subset(suspensionCoil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(suspensionCoil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(suspensionCoil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
## T-Tests on Suspension Coils
#Screen shots of the 4 t-test outputs
#Assuming a .05 confidence Interval for all of this
#overall we can't reject the null hypothesis that true mean is equal to 1500 (p=.06028)
#Lot1 we cannot reject the null hypothesis (p=1)
#Lot2 we cannot reject the null hypothesis (p=.6072)
#Lot3 we can reject the null hypothesis (p=.04168)

#part4
## Study Design: MechaCar vs Competition
# if we look at safety rating we need safety rating for each car and that cars type, size, weight, class
# Then I think we run an anova test followed with T.tests when the anova test rejects the null that all means are equal
