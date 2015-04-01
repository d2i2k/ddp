---
title       : Slidify
subtitle    : Reproducible pitch presentation
author      : d2i2k
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Galton Family Data (Slide 1)

The GaltonFamilies(HistData) dataset lists the individual observations for 934 adult children born to 205 fathers and mothers on which Sir Francis Galton (1886) based regression toward the mean. He wrote that, "the average regression of the offspring is a constant fraction of their respective mid-parental deviations." For height, Galton estimated this regression coefficient to be about two-thirds (2/3).

Galton, F. (1886). "Regression towards mediocrity in hereditary stature". The _Journal of the Anthropological Institute of Great Britain and Ireland_ __15__: 246-263.

--- .class #id 

## Scatterplot of Galton Family Data (Slide 2)

Scatter plot of Galton family data with height of the son or daughter in inches on the ordinate (y-axis) and parental mid-height in inches on the abcissa (x-axis).  

```r
library(HistData)
data(GaltonFamilies)
plot(jitter(GaltonFamilies$childHeight) ~ GaltonFamilies$midparentHeight,xlab="Average Height of the Parents (in inches)",ylab="Height of the Child (in inches)",main="Figure 1. Scatterplot of Galton Family Data with Fitted Values",pch=19,frame.plot=FALSE,col=ifelse(GaltonFamilies$gender=="female", "pink", "light blue"))
legend(65,80,pch=c(19,19),col=c("pink","light blue"),c("female", "male"),bty="o",cex=.8)
lines(GaltonFamilies$midparentHeight,fitted(fit),col="violet",lwd=2)
```

---     

## Linear Regression Models for Galton Family Data (Slide 3)

Gender-specific linear regression models fitted to Galton family data with height of the son or daughter as the dependent variable and parental mid-height as the independent variable.

```r
fit <- lm(childHeight ~ midparentHeight,data=GaltonFamilies)
fit1 <- lm(childHeight ~ midparentHeight,data=subset(GaltonFamilies,gender=="female"))
fit2 <- lm(childHeight ~ midparentHeight,data=subset(GaltonFamilies,gender=="male"))
summary(fit)
```

```
## 
## Call:
## lm(formula = childHeight ~ midparentHeight, data = GaltonFamilies)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -8.9570 -2.6989 -0.2155  2.7961 11.6848 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     22.63624    4.26511   5.307 1.39e-07 ***
## midparentHeight  0.63736    0.06161  10.345  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.392 on 932 degrees of freedom
## Multiple R-squared:  0.103,	Adjusted R-squared:  0.102 
## F-statistic:   107 on 1 and 932 DF,  p-value: < 2.2e-16
```

```r
summary(fit1)
```

```
## 
## Call:
## lm(formula = childHeight ~ midparentHeight, data = subset(GaltonFamilies, 
##     gender == "female"))
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -6.207 -1.412 -0.045  1.365  6.696 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     18.33348    3.60497   5.086 5.38e-07 ***
## midparentHeight  0.66075    0.05202  12.701  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.024 on 451 degrees of freedom
## Multiple R-squared:  0.2634,	Adjusted R-squared:  0.2618 
## F-statistic: 161.3 on 1 and 451 DF,  p-value: < 2.2e-16
```

```r
summary(fit2)
```

```
## 
## Call:
## lm(formula = childHeight ~ midparentHeight, data = subset(GaltonFamilies, 
##     gender == "male"))
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -9.5431 -1.5160  0.1844  1.5082  9.0860 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     19.91346    4.08943   4.869 1.52e-06 ***
## midparentHeight  0.71327    0.05912  12.064  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.3 on 479 degrees of freedom
## Multiple R-squared:  0.2331,	Adjusted R-squared:  0.2314 
## F-statistic: 145.6 on 1 and 479 DF,  p-value: < 2.2e-16
```

--- 

## Scatterplot Matrix of Galton Family Data (Slide 4)

Multiple Scatterplots of Galton family data with height of the son or daughter in inches on the ordinate (y-axis) and parental mid-height in inches on the abcissa (x-axis). Fitted values are predictions from a multiple regression model with child height as the dependent variable, parental mid-height and gender of the child as the independent variables (Slide 4). 

```r
qplot(midparentHeight,childHeight,colour=gender,data=GaltonFamilies,xlab="Average Height of the Parents (in inches)",ylab="Height of the Child (in inches)",main="Figure 2. Scatterplot matrix of Galton Family Data by Gender of the Child",facets=.~gender,geom=c("point","smooth"),method="lm")
```

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

---

## Multiple Regression Model for Galton Family Data (Slide 5)

Multiple regression model fitted to Galton family data with child height as the dependent variable, parental mid-height and gender of the child as the independent variables.

```r
library(ggplot2)
fit3 <- lm(childHeight ~ midparentHeight + gender,data=GaltonFamilies)
summary(fit3)
```

```
## 
## Call:
## lm(formula = childHeight ~ midparentHeight + gender, data = GaltonFamilies)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -9.5317 -1.4600  0.0979  1.4566  9.1110 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     16.51410    2.73392    6.04 2.22e-09 ***
## midparentHeight  0.68702    0.03944   17.42  < 2e-16 ***
## gendermale       5.21511    0.14216   36.69  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.17 on 931 degrees of freedom
## Multiple R-squared:  0.6332,	Adjusted R-squared:  0.6324 
## F-statistic: 803.6 on 2 and 931 DF,  p-value: < 2.2e-16
```

---












