#------------------------------------------
#   File dependecies: loadData.R
#                     household_power_consumption.txt                
#------------------------------------------

#------------------------------------------
#   check for data
#------------------------------------------
if(!("sub.dat" %in% ls())){
        source("loadData.R")
}

#------------------------------------------
#   Plot 4 : Multiple plots
#------------------------------------------
#   prepare PNG device
png('plot4.png', 480, 480)
par(mfrow = c(2,2))
with(sub.dat, {
        #   Plot 1
        plot(x=sub.dat$R.date.time 
             , y=sub.dat$Global_active_power
             , ylab="Global Active Power"
             , xlab=""
             , type="l")
        #   Plot 2
        plot(x=sub.dat$R.date.time 
             , y=sub.dat$Voltage
             , ylab="Voltage"
             , xlab="datetime"
             , type="l")
        #   Plot 3
        plot(x=sub.dat$R.date.time
             , y=sub.dat$Sub_metering_1
             , ylab="Energy sub metering"
             , xlab=""
             , type="l")
        lines(x=sub.dat$R.date.time
              , y=sub.dat$Sub_metering_2
              , type="l"
              , col="red")
        lines(x=sub.dat$R.date.time
              , y=sub.dat$Sub_metering_3
              , type="l"
              , col="blue")
        legend("topright"
               , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
               , lwd=c(1, 1, 1)
               , col=c("black", "red", "blue")
               , y.intersp=0.75
               , cex=0.9
               , bty="n")
        #   Plot 4
        plot(x=sub.dat$R.date.time
             , y=sub.dat$Global_reactive_power
             , ylab="Global_reactive_power"
             , xlab="datetime"
             , type="l")
})
dev.off()