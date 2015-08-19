---
title       : Body Mass Index calculator
subtitle    : Simple BMI calculator made with Shinyapps
author      : Sakari Hakala
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About project

This is a presentation made with R package slidify, and is a part of Coursera course Developing Data Products. Presentation is about Shiny application which calculates Body Mass Index with given height and weight. Application is located at https://sakke82.shinyapps.io/BMI_calc.

## About Body Mass Index

1. mid 1800's Adolphe Quetelet, "social physics".
2. 1972 Ancel Keys, best proxy for body fat percentage.
3. Keys cited BMI to be appropriate for measuring population and inappropiate for individual evalution.
4. Nevertheless widely used do to simplicity.
5. BMI between 18.5 - 25.0 is normal, under 18.5 underweight and over 25 overweight.

Go to Wikipedia page for more detailed information about BMI: https://en.wikipedia.org/wiki/Body_mass_index.

---

## How BMI is calculated

Body mass index is calculated by deviding weight (in kg) with square of height (in m). 
This can be written as:

$$BMI = \frac{weight}{(height)^2}$$

where weight is in kilograms and height is in meters.

For people used to pounds and inches we use formula:

$$BMI = \frac{weight_{lb}}{(height_{in})^2} * 703$$

where weight_lb is in pounds and height_in in inches.

More detailed formulas in http://www.calcbmi.com/.

--- .class #id

## About ui.R and server.R

Application is located at http://sakke82.shinyapps.io/BMI_calc. 

Application can handle metric and imperial units, default being metres and kilograms. If user wants to use pounds and inches he needs to select checkbox labeled: "pounds and inches".

User inputs values for height and weight fields, and when his ready, presses "submit"-button.

After user presses "Submit"-button, values are send to server.r function which does all calculation. Depending on users choise it calculates with metric or imperial values. When calculations are done server.r function sends BMI value with original user inputs back to ui.r function.

Now ui.r will update values it got from server.r to html-page for user to see inputs and calculated BMI value.

--- .class #id

## Example

Workhorse of server.R is function 'calc'. It takes 3 arguments, height and weight being user inputs, and us is boolean for checkbox "pounds and inches". There is calculations of same person in metric and imperial units.


```r
calc <- function(height, weight, us) {
        if (us) BMI <- (weight / height^2) * 703
        else BMI <- weight / ((height/100)^2)
        BMI
        }

cbind('metric' = calc(203,113,0), 'imperial' = calc(80,250,1))
```

```
##        metric imperial
## [1,] 27.42119 27.46094
```
This is basketball player Lebron James's height and weight, and hes BMI is 27.4. Everybody can figure out is he overweight as BMI says... 

