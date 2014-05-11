#Load data file
#Assume that the data file is in the current directory, otherwise user will have to change directory
household <- read.csv2('household_power_consumption.txt', na.strings='?', as.is=TRUE)

#fix column names to be tidy
names(household) <- gsub('_','',names(household))

#convert Date column to appropriate data type
household$Date <- as.Date(household$Date,format='%d/%m/%Y')

#subset to data between 2007-02-01 and 2007-02-02 to improve performance
householdSub <- subset(household, household$Date >= '2007-02-01' & household$Date <= '2007-02-02')

# PLOT 1:
#open png device. Note: default dimensions are 480x480
png(file='plot1.png')

#generate frequency histogram
hist(householdSub$Globalactivepower, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

#close png device
dev.off()
