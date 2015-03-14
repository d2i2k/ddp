#setwd("C:/COURSERA/Development Data Products/project/mpg")
library(shiny)
library(datasets)

mtcarsData <- mtcars
mtcarsData$am <- factor(mtcarsData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
        
        formulaText <- reactive({
                paste("mpg ~", input$variable)
        })
        
        formulaTextPoint <- reactive({
                paste("mpg ~", "as.integer(", input$variable, ")")
        })
        
        fit <- reactive({
                lm(as.formula(formulaTextPoint()), data=mtcarsData)
        })
        
        output$caption <- renderText({
                formulaText()
        })
        output$mpgBoxPlot <- renderPlot({
                boxplot(as.formula(formulaText()), 
                        data = mtcarsData, ylab = "Miles per gallon",
                        main = paste("Miles per gallon vs.", "variable (", input$variable, ")"),
                        outline = input$outliers)
        })
        
        output$fit <- renderPrint({
                summary(fit())
        })
        
        output$mpgPlot <- renderPlot({
                with(mtcarsData, {
                        plot(as.formula(formulaTextPoint()))
                        abline(fit(), col=2)
                })
        })
        
})