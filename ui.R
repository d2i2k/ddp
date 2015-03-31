   library(shiny)
shinyUI(
  navbarPage("Developing Data Products - Shiny Application",
             tabPanel("Analytical Results",
                      fluidPage(
                        headerPanel("Galton Family Data Analysis"),
                        sidebarLayout(                            
                        sidebarPanel(sliderInput('mean','Mid-parent Height',value=69.2,min=64,max=76,step=0.1,),     
     h3('Linear Regression Model for Females and Males (n=934)'),
     h5('childHeight = 22.63624 + 0.63736*midparentheight'),
     h5('Goodness-of-Fit'),
     h5('R-squared = 0.103'),  
       
     h3('Linear Regression Model for Females (n=453)'),
     h5('childHeight = 18.33348 + 0.66075*midparentheight'),
     h5('Goodness-of-Fit'),
     h5('R-squared = 0.263'),
    
     h3('Linear Regression Model for Males (n=481)'),
     h5('childHeight = 19.91346 + 0.71327*midparentheight'),
     h5('Goodness-of-Fit'),
     h5('R-squared = 0.223'),
     
     h3('Multiple Regression Model'),
     h5('childHeight = 16.5141 + 0.68702*midparentheight + 5.21511*gender'),
     h5('Goodness-of-Fit'),
     h5('R-squared = 0.633')
     
   ),
   
   mainPanel(
     plotOutput("scatterPlot"),
     plotOutput("scatterplotMatrix"),
     plotOutput("scatterPlot2")

     )
   )
  )
),
   
   tabPanel("Regression Analysis",
            h2("Galton Family Data Analysis"),
            hr(),
            h3("First, fit a linear regression model to Galton family data for both genders with child height as the dependent variable and parental mid-height the independent variable. Next, fit gender-specific, linear regression models with heights of sons and daughters as the dependent variables and parental mid-height the independent variable. Finally, fit a multiple regression model with two independent variables, a common slope and different intercepts adjusted for gender.”)
           ),

   tabPanel("Data Description",
            h2("Galton Family Data"),
            hr(),
            h3("The GaltonFamilies(HistData) dataset lists the individual observations for 934 adult children born to 205 fathers and mothers on which Sir Francis Galton based his conjecture about regression to the mean. Numeric variables include heights of the child, father and mother, as well as the number of children in the family. Gender, female or male, is a factor variable.”)
           )

))
   
