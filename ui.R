ui <- shinyUI(
  fluidPage(
    
    title = "Live Markdown App",
    
    tags$nav(class="navbar navbar-dark bg-primary"),
    
    
    h1("Write Rmd documents on the left and view output on the right"),
    
    fluidRow(
      
      tags$head(
        ## include MathJax library to render Latex Math expression
        tags$script(src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML",
                    type = 'text/javascript'),
        # custom project js file
        tags$script(src = 'ace-shiny.js', type = 'text/javascript')
      ),
      
      column(
        width = 6,
        h2("Source R-Markdown"),
        
        # ace Themes
        fluidRow(
          column(width = 2, 
                 style = "padding-top: 5px;",
                 tags$b("Select Theme")
          ),
          column(width = 3, 
                 style = "padding-left: 0;",
                 selectInput(inputId = "aceTheme", label = NULL, choices = getAceThemes(), selected = "dreamweaver", selectize = TRUE, width = "auto")
          ),
          
          column(width = 3, 
                 style = "padding-top: 5px;",
                 tags$b("Select Editor Example")
          ),
          column(width = 3, 
                 style = "padding-left: 0;",
                 selectInput(
                   inputId = "editorExample",
                   label = NULL,
                   choices = c("All Syntax" = "knitExample_Basic.Rmd", "R + MathJax" = "knitExample_Allfeatures.Rmd"),
                   selectize = TRUE,
                   width = "auto"
                 )
          )
          
          # # update button
          # column(width = 4,
          #        actionButton(inputId = "eval", label = "Update")
          # )
        ),
        
        includeMarkdown(file.path("R","sourceRmdWriteup.Rmd")),
        
        uiOutput("rmdUIspace")
        
        # # capture RMD input
        # aceEditor(outputId = "rmd",
        #           mode = "markdown", #"markdown", "r"
        #           value = initRmdExample,
        #           theme = "dreamweaver",
        #           readOnly = FALSE,
        #           fontSize = 12,
        #           wordWrap = TRUE,
        #           debounce = 1000,
        #           showLineNumbers = TRUE,
        #           highlightActiveLine = TRUE,
        #           autoScrollEditorIntoView = TRUE,
        #           minLines = 55,
        #           maxLines = 500,
        #           autoComplete = "enabled",
        #           # autoCompleteList = c("static", "keyword", "rlang", getNamespaceExports('ggplot2'), getNamespaceExports('dplyr'))
        #           autoCompleteList = c("static", "keyword", "rlang")
        # )
        
      ),
      column(
        width = 6,
        h2("Knitted HTML Output"),
        
        htmlOutput("knitDoc")
      )
    )
  )
  
  
) #close shinyUI