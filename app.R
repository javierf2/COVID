

library(shiny)
library(shinydashboard)
library(DT)
library(tidyverse)
library(dplyr)
library(purrr)
library(rlang)
library(stringr)
library(noteMD)
library(DT)
library(r2d3)
library(webshot)
library(htmlwidgets)
library(memor)
library(shinyjs)
library(nivopie)
library(summarytools)
library(rsconnect)

#source('~/COVID/readdata.R')
#Need to update directory to reflect location where data is stored



ui <- 
    dashboardPage(
        
        dashboardHeader(title = "VAERs Dashboard"),
        dashboardSidebar(
            sidebarMenu(
               menuItem("HOME", tabName = "Home", icon = icon("home")),
              #  menuItem("Metrics", tabName = "metrics"),
                menuItem("Raw", tabName = "raw")
                
                )),
        
        dashboardBody(
            tabItems(
                tabItem(
                    tabName = "Home",
                    HTML(
                        
                        "<br>",
                        "<br>",
                        "<br>",
                        "<a href='https://www.vaers.hhs.gov/'>
                    <img style = 'padding: 50px 50px; display: block; max-width: 100%; margin-left: auto; margin-right: auto; background-color:#3c8dbc; ' 
                    src='https://vaers.hhs.gov/images/vaers-logo.png'></a>",
                        "<br>",
                        "<br>",
                        "<p style = 'text-align: center'>
                    <font size =6>
                    Pandemic Info
                    </font>
                    </p>",
                        "<br>",
                        "<br>",
                        "<br>",
                        
                    #    "<table border = '5' align = 'center'>
#  <thead>
 #   <tr>
  #  <tr align = 'center'>
  #    <th style='padding: 17px' colspan='2' height = '100' width = '800'>A Phase 2, Randomized, Double-Blind, Placebo-Controlled Study Evaluating the Safety, Efficacy, 
   #                 and Pharmacokinetics of Miricorilant in Obese Adult Patients with Schizophrenia Taking Antipsychotic 
 #                   Medications (GRATITUDE II)</th>
  #  </tr>
#  </thead>
 # <tbody>
  #  <tr>
      #  <style>
     #   tr:nth-child(1) { border: solid thick collapse; }
    #    </style>
   #   <td style='padding: 10px'><strong>Investigational Product </strong></td>
  #    <td style='padding: 10px'> Miricorilant</td>
 #   </tr>
#    <tr style='border: solid thick collapse';>
     # <td align = 'center'><strong>Medical Monitor</strong></td>
     # <td style='padding: 10px'> Ada Lee, MD
    #                            Telephone: +1 (650) 688-2854 
   #                             Email: alee@corcept.com
  #  </td>
   # <tr style='border: solid thick collapse';>
  #    <td align = 'center';style='padding: 10px'><strong>Sponsor</strong></td>
 #     <td style='padding: 10px'> Corcept Therapeutics Incorporated  149 Commonwealth Drive Menlo Park, 
 #                               California 94025 US +1 (650) 327-3270 
   # </td>
  #  <tr style='border: solid thick collapse';>
     # <td align = 'center'><strong>Version</strong></td>
    #  <td style='padding: 10px'> Amendment 2
   # </td>
  #  <tr style='border: solid thick collapse';>
    #  <td align = 'center'><strong>Date</strong></td>
   #   <td style='padding: 10px'> 27 April 2021 
  #  </td>
 # </tbody>
#</table>",
                    )),
               
               # tabItem(
                 # tabName = "metrics",
                #  tabsetPanel(type = "tab",
                #  tabPanel("Page Status",htmlOutput("met"),htmlOutput("met2")),
                #  tabPanel("Query Status", htmlOutput("o"), htmlOutput("openage"),htmlOutput("a"),htmlOutput("answeredage"),htmlOutput("all")),
                #  tabPanel("Adverse Events", htmlOutput("aemet")),
                #  tabPanel("Concomitant Medications", htmlOutput("cmmet")),
                #  tabPanel("Medication History", htmlOutput("mhmet")),
                #  tabPanel("Subject Status", htmlOutput("subm"))
            #      )),                
                tabItem("raw",
                        tabsetPanel(type = "tab",
                         tabPanel("Covid Data",
                            selectInput("SelectColumns1", "Select AE Columns:",selected = names(varsdata), choices = names(varsdata), multiple = T, width = 2000),
                            DT::dataTableOutput("varsdata"))))
        )
    ),
)
    
    
          
        
server <- function(input, output, session) {

# Raw data (server)------------------------------------------------------
    output$varsdata <- renderDataTable(
      varsdata %>% 
            select(!!! rlang::syms(input$SelectColumns1)), 
        extensions = c("FixedColumns", "Scroller", "Buttons"), 
        options = list(
            dom = 'Bfrtip', 
            buttons = list('csv', 'pdf', 'excel'),
            #deferRender = TRUE,
            searching = TRUE,
            autoWidth = TRUE,
            #scrollCollapse = TRUE,
            rownames = TRUE,
            scroller = TRUE,
            scrollX = "1000px",
            scrollY = "1000px",
            #fixedHeader = TRUE,
            class = 'cell-border stripe')
    )
}

shinyApp(ui = ui, server = server)

