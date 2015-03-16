---
title       : Developing Data Products mtcars
subtitle    : Relationship between variables (Predictors) and miles per gallon (MPG) 
author      : Jorge Gonzalez
job         : Project Manager, Lean Six Sigma Black Belt
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Project Objective

Motor Trend, an automobile trend magazine is interested in exploring the relationship between a set of variables and miles per gallon (MPG) outcome. In this project, we will analyze the mtcars dataset (Shown below) from the 1974 Motor Trend US magazine to find the variable that  have more impact in the car performance (MPG).

```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

--- .class #id 

## Exploratory analysis

Boxplots were produced to show the difference between variables in terms of MPG. As an example the plot below show the variable "transmission" vs MPG. To see other variables  impact click [shiny application](https://developmentdataproducts.shinyapps.io/ddp-master/).

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 


---

## Regression Model 

One of the most significant predictors in determining the MPG was the type of transmission  (am). The summary for this model is show in the [shiny application](https://developmentdataproducts.shinyapps.io/ddp-master/) under the "Regression model" tab. (select the variable transmission (am) and check intercept = 7.245)


```r
lm(formula = mpg ~ am, data = mtcars)
```

```
## 
## Call:
## lm(formula = mpg ~ am, data = mtcars)
## 
## Coefficients:
## (Intercept)     amManual  
##      17.147        7.245
```

---

## Conclusion

The transmission type of a car has a significant effect on its fuel efficiency.










Hope you enjoyed this presentation; slidify and shiny are amazing products.


Thanks to Coursera for providing the Data Science Specialization.









