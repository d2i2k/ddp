library(HistData)
data(GaltonFamilies)
library(ggplot2)

fit <- lm(childHeight ~ midparentHeight,data=GaltonFamilies)
fit1 <- lm(childHeight ~ midparentHeight,data=subset(GaltonFamilies,gender=="female"))
fit2 <- lm(childHeight ~ midparentHeight,data=subset(GaltonFamilies,gender=="male"))
fit3 <- lm(childHeight ~ midparentHeight+gender,data=GaltonFamilies)

summary(fit)
summary(fit1)
summary(fit2)
summary(fit3)

shinyServer(
  function(input, output) {
    output$scatterPlot <- renderPlot({
      plot(jitter(GaltonFamilies$childHeight) ~ GaltonFamilies$midparentHeight,xlab="Average Height of the Parents (in inches)",ylab="Height of the Child (in inches)",main="Scatterplot of Galton Family Data on 934 Adult Children (481 sons, 453 daughters)",pch=19,frame.plot=FALSE,
           col=ifelse(GaltonFamilies$gender=="female", "pink", "light blue"))
      legend(65,80,pch=c(19,19),col=c("pink","light blue"),c("female", "male"),bty="o",cex=.8)
      lines(GaltonFamilies$midparentHeight,fitted(fit),col="magenta",lwd=2)
      abline(h=mean(GaltonFamilies$childHeight),lwd=1)
      mean <- input$mean
      lines(c(mean,mean),c(0,200),lwd=3)
    })
    output$scatterplotMatrix <- renderPlot({
      qplot(midparentHeight,childHeight,colour=gender,data=GaltonFamilies,xlab="Average Height of the Parents (in inches)",ylab="Height of the Child (in inches)",main="Scatterplot matrix of Galton Family Data by Gender of the Child",facets=.~gender,geom=c("point","smooth"),method="lm")
      })
  }
)

