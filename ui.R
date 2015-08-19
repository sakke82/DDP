shinyUI(
        pageWithSidebar(
                        headerPanel("BMI calculator"),
                        sidebarPanel(
                                     checkboxInput('us', label = 'pounds and inches', 
                                                   value = FALSE ), 
                                     numericInput('height','Height (cm)', 170, min=50, 
                                                  max=300),
                                     numericInput('weight', 'Weight (kg)', 70, min = 10,
                                                  max=300),
                                     
                                     submitButton('Submit')
                        ),
                        mainPanel(
                                h3('Results'),
                                h4('You entered height'),
                                verbatimTextOutput('inputHeight'),
                                h4('You entered weight'),
                                verbatimTextOutput('inputWeight'),
                                h4('Calculated BMI'),
                                verbatimTextOutput('BMI'),
                                
                                h4('This is simple body mass index, BMI, calculator. User 
                                   inputs weight in kilograms and height in centimeters, 
                                   and program calculates BMI value with given arguments. 
                                   For users from US, check \"pounds and inches\" box to use
                                   pounds and inches.
                                   ')
                        )
        )
)