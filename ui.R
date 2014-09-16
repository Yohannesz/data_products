library(shiny)

# Define UI Crime Idex data obtained from the following sources
shinyUI(fluidPage(
        titlePanel(" Violent Crime Severity Index on major Canadian Cities"),
      
        
        # Sidebar with controls to select the variable to plot against Crime Index
        # and to specify whether outliers should be included
        sidebarLayout(
                
        sidebarPanel(
                selectInput("variable", "Variable:",
                            list("Year" = "year", 
                                 "City" = "city")),
                
                checkboxInput("outliers", "Show outliers", TRUE),
                helpText("Note: Choose Variable city or Year.", 
                         "The outliers check box will show only the for ",
                         "variable Year.",
                         "The table shows highest crime index obtained from",
                         "year 2009 to 2012")
                
        ),
        
        
        # Show the caption and plot of the requested variable against Crime Index
        mainPanel(
                p(" This Shiny app was developed to show the Violent crime severity index variable over year 2009 - 2012 
                and by major canadian cities."),
                
                p("Data is obtained from stats canada."),
                
                h5(a("http://www.statcan.gc.ca/pub/85-002-x/2012001/article/11692/tbl/tbl03-eng.htm", href="http://www.statcan.gc.ca/pub/85-002-x/2012001/article/11692/tbl/tbl03-eng.htm")),
                h5(a("http://www.statcan.gc.ca/daily-quotidien/110721/t110721b3-eng.htm", href="http://www.statcan.gc.ca/daily-quotidien/110721/t110721b3-eng.htm")),
                h5(a("http://www.statcan.gc.ca/pub/85-002-x/2010002/article/11292/tbl/tbl4-eng.htm", href="http://www.statcan.gc.ca/pub/85-002-x/2010002/article/11292/tbl/tbl4-eng.htm")),
                h5(a("http://www.statcan.gc.ca/pub/85-002-x/2013001/article/11854/c-g/desc/desc09-eng.htm", href="http://www.statcan.gc.ca/pub/85-002-x/2013001/article/11854/c-g/desc/desc09-eng.htm")),
                
                h3(textOutput("caption")),
                
                plotOutput("CrimePlot"),
                h4("Highest violent crime index were shown in the following cities"),
                tableOutput("view")
        )
        )
))
