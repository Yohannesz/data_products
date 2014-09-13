library(shiny)
 require("xlsx")
cdata<- read.xlsx("crime.xlsx", 1 , stringsAsFactors=F, header=TRUE)

IndexData <- cdata
IndexData$Year <- factor(IndexData$year)
IndexData$Crime_index<-as.numeric(IndexData$crime_index)
# Define server logic required to plot various variables against Crime index
shinyServer(function(input, output) {
        
   
        formulaText <- reactive({
                paste("Crime_index ~", input$variable)
        })
        
        # Return the formula text for printing as a caption
        output$caption <- renderText({
                formulaText()
        })
        
        # Generate a plot of the requested variable against cirme_index and only 
        # include outliers if requested
        output$CrimePlot <- renderPlot({
                boxplot(as.formula(formulaText()), 
                        data = IndexData, las=2, par(mar = c(14, 5, 4, 2)+ 0.1), col="red",
                        #horzontal=TRUE, varwidth=TRUE,
                        cex.lab=1.3, outline = input$outliers)
        })
})