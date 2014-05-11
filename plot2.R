#Load data file
#Assume that the data file is in the current directory, otherwise user will have to change directory
household <- read.csv2('household_power_consumption.txt', na.strings='?', as.is=TRUE)

#fix column names to be tidy
names(household) <- gsub('_','',names(household))

#convert Date column to appropriate data type
household$Date <- as.Date(household$Date,format='%d/%m/%Y')

#subset to data between 2007-02-01 and 2007-02-02 to improve performance
householdSub <- subset(household, household$Date >= '2007-02-01' & household$Date <= '2007-02-02')

# PLOT 2:
#open png device. Note: default dimensions are 480x480
png(file='plot2.png')

#generate line plot
plot(householdSub$datetime,householdSub$Globalactivepower,type='l',xlab='', ylab='Global Active Power (kilowatts)')

#close png device
dev.off()