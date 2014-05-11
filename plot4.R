#Load data file
#Assume that the data file is in the current directory, otherwise user will have to change directory
household <- read.csv2('household_power_consumption.txt', na.strings='?', as.is=TRUE)

#fix column names to be tidy
names(household) <- gsub('_','',names(household))

#convert Date column to appropriate data type
household$Date <- as.Date(household$Date,format='%d/%m/%Y')

#subset to data between 2007-02-01 and 2007-02-02 to improve performance
householdSub <- subset(household, household$Date >= '2007-02-01' & household$Date <= '2007-02-02')

# PLOT 4:
#open png device. Note: default dimensions are 480x480
png(file='plot4.png')

#create 2x2 canvas
par(mfrow = c(2,2))
with(householdSub, {

  #generate line plot Global Active Power vs Weekday - ie. top left plot
  plot(datetime,Globalactivepower,type='l',xlab='', ylab='Global Active Power')
  
  #generate line plot Voltage vs datetime - ie. top right plot
  plot(datetime,Voltage,type='l',xlab='datetime', ylab='Voltage')
  
  #generate line plots Energy sub metering vs Weekday - ie. bottom left plot
  plot(datetime,Submetering1,type='l',xlab='', ylab='Energy sub metering')
  lines(datetime,Submetering2,type='l',col='red')
  lines(datetime,Submetering3,type='l',col='blue')
  legend('topright',lty=c(1,1),col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  
  #generate line plot Global_reactive_power vs datetime - ie. bottom right plot
  plot(datetime,Globalreactivepower,type='l',xlab='datetime', ylab='Global_reactive_power')
  
})

#close png device
dev.off()
