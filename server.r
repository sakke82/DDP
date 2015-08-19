calc <- function(height, weight, us) {
        if (us) BMI <- (weight / height^2) * 703
        else BMI <- weight / ((height/100)^2)
        BMI
        }

shinyServer(
        function(input,output){
                output$inputHeight <- renderPrint({input$height})
                output$inputWeight <- renderPrint({input$weight})

                output$BMI <- renderPrint({calc(input$height,input$weight, input$us)})
        }
)