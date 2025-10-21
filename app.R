#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

library(shiny)
library(bslib)
library(dplyr)
library(ggplot2)
load(gzcon(url("https://github.com/UMichNMR-Metabolomics/OVPRNon-TranscriptomicsDataBrowser/raw/refs/heads/main/browserdata.RData")), envir = .GlobalEnv)


# Define UI
ui <-  page_fluid(
  title = "OVPR Non-Transcriptomics Data Browser",
  layout_columns(
    card(
      card_header("Plot Parameters"),
      "Use this data browser to display longitudinal plots of various measurements from the 2024 OVPR Septic Pig experiments. Because of the immense wealth of data available for these animals, you will need to first select the type of data you want to plot (e.g. CBC results, Metabolomics data, etc.), and then you can select the specific variable you'd like to examine.",
      selectInput(
        "sel1",
        "First choose the type of data you want plotted:",
        sort(variable.classes)
      ),
      selectInput(
        "sel2",
        "Then choose the specific variable you want to look at:",
        variables["CA Metabolomics"]
      ),
      "Because of the way data is formatted, the appearance of different plots will vary. Some plots may display an incomplete x-axis, which is reflective of missing data from all animals for the timepoints which are not displayed.",
      br(), br(),
      "When available in the input dataframe, units will be indicated on the Y-axis. Some variables do not have units (e.g. All metabolomics data are peak areas)"
    ),
    card(
      card_header("Plot of Selected Variable"),
      plotOutput("plot", height = "750px", width = "auto")
    ),
    col_widths = c(3, 9)
  )
)

# Define server logic
server <- function(input, output, session) {
  
  #This keeps track of the input from the first dropdown menu and uses that information to update the choices available in the second dropdown
  observeEvent(input$sel1, { #observeEvent must be used here instead of observe for some reason - not sure why
    updateSelectInput(session,
                      "sel2",
                      choices = variables[paste(input$sel1)])
  })

  output$plot <- renderPlot({
    vartype <- input$sel1
    varname <- input$sel2
    plotfunc(vartype, varname)
  })

  
}

# Run the application 
shinyApp(ui = ui, server = server)
