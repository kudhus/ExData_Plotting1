#Load data file
#Assume that the data file is in the current directory, otherwise user will have to change directory
household <- read.csv2('household_power_consumption.txt', na.strings='?', as.is=TRUE)

#fix column names to be tidy
names(household) <- gsub('_','',names(household))

#convert Date column to appropriate data type
household$Date <- as.Date(household$Date,format='%d/%m/%Y')

#subset to data between 2007-02-01 and 2007-02-02 to improve performance
householdSub <- subset(household, household$Date >= '2007-02-01' & household$Date <= '2007-02-02')

# PLOT 3:
#open png device. Note: default dimensions are 480x480
png(file='plot3.png')

#generate line plots
plot(householdSub$datetime,householdSub$Submetering1,type='l',xlab='', ylab='Energy sub metering')
lines(householdSub$datetime,householdSub$Submetering2,type='l',col='red')
lines(householdSub$datetime,householdSub$Submetering3,type='l',col='blue')
legend('topright',lty=c(1,1),col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#close png device
dev.off()