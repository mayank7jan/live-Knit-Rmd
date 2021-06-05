ui <- shinyUI(
  fluidPage(
    
    # shinythemes::themeSelector(),
    
    # Main application under Navigation Bar
    navbarPage(
      windowTitle = "Live Markdown App",
      title = "Live Markdown Blogger Application",
      position = "fixed-top",
      collapsible = TRUE,
      theme = shinytheme("cerulean"),
      
      # Tab 1 - Create ----
      tabPanel(
        title = "Create",
        icon = icon("edit"),
        
        fluidRow(
          # shinythemes::themeSelector(),
          column(
            width = 6,
            h2("Source R-Markdown"),
            
            # ace Themes
            fluidRow(
              column(width = 2,
                     style = "padding-top: 5px;",
                     tags$b("Editor Theme")),
              column(
                width = 3,
                style = "padding-left: 0;",
                selectInput(
                  inputId = "aceTheme",
                  label = NULL,
                  choices = getAceThemes(),
                  selected = "dreamweaver",
                  selectize = TRUE,
                  width = "auto"
                )
              ),
              
              column(
                width = 3,
                style = "padding-top: 5px; width: auto;",
                tags$b("Editor Example")
              ),
              column(
                width = 3,
                style = "padding-left: 0;",
                selectInput(
                  inputId = "editorExample",
                  label = NULL,
                  choices = c("All Syntax" = "knitExample_Basic.Rmd", "R + MathJax" = "knitExample_Allfeatures.Rmd"),
                  selectize = TRUE,
                  width = "auto"
                )
              )
            ),
            
            includeMarkdown(file.path("R", "sourceRmdWriteup.Rmd")),
            
            # uiOutput("rmdUIspace"),
            
            aceEditor(outputId = "rmd",
                      mode = "markdown", #"markdown", "r"
                      value = initRmdExample,
                      theme = "textmate", #"dreamweaver",
                      readOnly = FALSE,
                      fontSize = 12,
                      wordWrap = TRUE,
                      debounce = 1000,
                      showLineNumbers = TRUE,
                      highlightActiveLine = TRUE,
                      autoScrollEditorIntoView = TRUE,
                      minLines = 55,
                      maxLines = 500,
                      autoComplete = "enabled",
                      # autoCompleteList = c("static", "keyword", "rlang", getNamespaceExports('ggplot2'), getNamespaceExports('dplyr'))
                      autoCompleteList = c("static", "keyword", "rlang")
            )
            
          ),
          column(width = 6,
                 h2("Knitted HTML Output"),
                 
                 htmlOutput("knitDoc"))
        )
        
        
      ) # close of tab 1
      
      # # GitHub Widget ----
      # tabPanel(
      # # tags$li(
      #   # style = "float: right !important; display: inline-flex !important;",
      #   # class = "Custom-tabPanel-right",
      #   
      #   # tags$div(
      #   # title = 'GitHub',
      #   # onclick ="window.open('https://github.com/mayank7jan/live-Knit-Rmd')",
      #   # target = "_blank",
      #   # icon('github')
      #   # )
      #   
      #   title = span(a(
      #     id = "github_id",
      #     title = 'GitHub',
      #     href = "https://github.com/mayank7jan/live-Knit-Rmd",
      #     target = "_blank",
      #     icon('github')
      #     # class = "Custom-tabPanel-right"
      #     # style = "float: right !important; display: inline-flex !important;"
      #   ))
      # )
      
    ), # navbarPage close
    
    # css
    tags$link(rel = 'stylesheet',
              type = 'text/css',
              href = 'shiny.css'),
    
    ## Bottom JS
    # include MathJax library to render Latex Math expression
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML",
                type = 'text/javascript'),
    # custom project js file
    tags$script(src = 'ace-shiny.js', type = 'text/javascript')
  
    
  ) # close top level fluidPage
) #close shinyUI