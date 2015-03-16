library(shiny)

shinyUI(
        navbarPage("Developing Data Products - Shiny Application",
                   tabPanel("Analysis",
                            fluidPage(
                                    titlePanel("Relationship between variables (Predictors) and miles per gallon (MPG)"),
                                    sidebarLayout(
                                            sidebarPanel(
                                                    selectInput("variable", "Select Variable",
                                                                c("Number of cylinders" = "cyl",
                                                                  "Displacement (cu.in.)" = "disp",
                                                                  "Gross horsepower" = "hp",
                                                                  "Rear axle ratio" = "drat",
                                                                  "Weight (lb/1000)" = "wt",
                                                                  "1/4 mile time" = "qsec",
                                                                  "V/S" = "vs",
                                                                  "Transmission" = "am",
                                                                  "Number of forward gears" = "gear",
                                                                  "Number of carburetors" = "carb"
                                                                )),
                                                    
                                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                            ),
                                            
                                            mainPanel(
                                                    h3(textOutput("caption")),
                                                    
                                                    tabsetPanel(type = "tabs", 
                                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                                tabPanel("Regression model", 
                                                                         plotOutput("mpgPlot"),
                                                                         verbatimTextOutput("fit")
                                                                )
                                                    )
                                            )
                                    )
                            )
                   ),
                   tabPanel("Summary",
                            h2("Executive Summary"),
                            hr(),
                            h3("Motor Trend, an automobile trend magazine is interested in exploring the relationship between a set of
                                variables and miles per gallon (MPG) outcome. In this project, we will analyze the mtcars dataset from the
                                1974 Motor Trend US magazine"),
                            helpText("Using linear regression analysis, we determine that there is a signficant difference between the mean MPG for
                                automatic and manual transmission cars. Manual transmissions achieve a higher value of MPG compared
                                to automatic transmission. This increase is approximately 1.8 MPG when switching from an automatic
                                     transmission to a manual one, with all else held constant."),
                            h3("Note"),
                            p("Data frame mtcars from R dataset - library(datasets)."),
                            
                            a("https://class.coursera.org/regmods-008")
                   ),
                   tabPanel("Data Description",
                            h2("Motor Trend Car Road Tests"),
                            hr(),
                            h3("Description"),
                            helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                                     " and comprises fuel consumption and 10 aspects of automobile design and performance",
                                     " for 32 automobiles (1973-74 models)."),
                            h3("Format"),
                            p("A data frame from R dataset package."),
                            
                            p("  [, 1]   mpg     Miles/(US) gallon"),
                            p("  [, 2]   cyl	 Number of cylinders"),
                            p("  [, 3]	 disp	 Displacement (cu.in.)"),
                            p("  [, 4]	 hp	 Gross horsepower"),
                            p("  [, 5]	 drat	 Rear axle ratio"),
                            p("  [, 6]	 wt	 Weight (lb/1000)"),
                            p("  [, 7]	 qsec	 1/4 mile time"),
                            p("  [, 8]	 vs	 V/S"),
                            p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                            p("  [,10]	 gear	 Number of forward gears"),
                            p("  [,11]	 carb	 Number of carburetors"),
                            
                            h3("Source"),
                            
                            p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
                   ),
                   tabPanel("Instructions",
                            a(""),
                            hr(),
                            h2("Instructions"),
                            
                            h4(" - Select variable on the dropdown menu (left) of the screen"),
                            h4(" - click -Boxplot- to see the relationship variable vs performance"),
                            h4(" - click -Regression Model- to see the results of the Linear Model"),
                            h4(" - check/uncheck -Show BoxPlot's outliers- to supress /show outliners")
                   )
        )
)