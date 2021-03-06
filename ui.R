ui <- shinyUI(
  fluidPage(
    
    # shinythemes::themeSelector(),
    tags$div(id = "AppThemeSelector",
             style = "display:none;",
             shinythemes::themeSelector()),
    
    # change browser tab icon
    tags$head(
      tags$link(rel = 'icon',
                type = 'image/png',
                href = 'pencil.png')
    ),
    
    # Main application under Navigation Bar
    navbarPage(
      windowTitle = "Live Markdown App",
      title = "Live Markdown Blogger Application",
      position = "fixed-top",
      collapsible = TRUE,
      theme = shinytheme("cerulean"),
      
      # Tab 1 - View ----
      tabPanel(
        title = "View",
        icon = icon("chalkboard"),
        
        fluidRow(column(
          style = "margin-top: 70px; padding: 0;",
          width = 12,
          
          column(width = 1,
                 style = "padding-top: 5px; width: auto;",
                 tags$b("Editor Theme")), 
          column(
            width = 2,
            style = "padding-left: 0;",
            selectInput(
              inputId = "aceThemeView",
              label = NULL,
              choices = getAceThemes(),
              selected = "dreamweaver",
              selectize = TRUE,
              width = "auto"
            )
          ), 
          column(width = 1,
                 style = "padding-top: 5px; width: auto;",
                 tags$b("Editor Example")),
          column(
            width = 2,
            style = "padding-left: 0;",
            selectInput(
              inputId = "editorExampleView",
              label = NULL,
              choices = c("All Syntax" = "knitExample_Basic.Rmd", "R + MathJax" = "knitExample_Allfeatures.Rmd"),
              selectize = TRUE,
              width = "60%"
            )
          ),
          
          # dummy space
          column(3),
          
          # tags$div(id = "AppThemeSelector",
          #          style = "display:none;",
          #          shinythemes::themeSelector()), 
          
          column(
            width = 2,
            checkboxInput(
              inputId = "appThemeToggle",
              label = "Choose App Theme?",
              width = "auto"
            )
          )
          
          # column(width = 1,
          #        style = "padding-top: 5px; width: auto;",
          #        tags$b("App Theme")),
          # column(
          #   width = 2,
          #   style = "padding-left: 0;",
          #   selectInput(
          #     inputId = "appTheme",
          #     label = NULL,
          #     choices = themeOpts,
          #     selected = "cerulean",
          #     selectize = TRUE,
          #     # width = "60%"
          #     width = "auto"
          #   )
          # )
          
          
        )), 
        
        includeMarkdown(file.path("R", "sourceRmdWriteup.Rmd")),
        
        fluidRow(
          # shinythemes::themeSelector(),
          column(
            width = 6,
            h2("Source R-Markdown"),
            
            # includeMarkdown(file.path("R", "sourceRmdWriteup.Rmd")),
            
            aceEditor(outputId = "rmdView",
                      mode = "markdown", #"markdown", "r"
                      value = initRmdExample,
                      theme = "dreamweaver",
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
                 
                 htmlOutput("knitDocView")
          )
        )
        
      ), # close of tab 1
      
      # Tab 2 - Create ----
      tabPanel(
        title = "Create",
        icon = icon("edit"),
        
        fluidRow(column(
          style = "margin-top: 70px; padding: 0;",
          width = 12,
          
          column(width = 1,
                 style = "padding-top: 5px; width:auto;",
                 tags$b("Editor Theme")),
          column(
            width = 2,
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
            width = 2,
            style = "width:auto;",
            downloadButton(
              outputId = "DownloadRmd",
              label = "Download R-Markdown file"
            )
          ),
          column(
            width = 2,
            style = "width:auto;",
            downloadButton(
              outputId = "DownloadHTML",
              label = "Download Knitted HTML"
            )
          )
          
          
        )),
        
        includeMarkdown(file.path("R", "sourceRmdWriteup.Rmd")),
        
        fluidRow(
          
          column(
            width = 6,
            h2("Source R-Markdown"),
            aceEditor(outputId = "rmd",
                      mode = "markdown", #"markdown", "r"
                      # value = initRmdExample,
                      value = paste(readLines(file.path("R","knitExample_Create.Rmd")), collapse = "\n"),
                      theme = "textmate", #"dreamweaver",
                      readOnly = FALSE,
                      fontSize = 12,
                      wordWrap = TRUE,
                      debounce = 1000,
                      showLineNumbers = TRUE,
                      highlightActiveLine = TRUE,
                      autoScrollEditorIntoView = TRUE,
                      minLines = 35,
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
        
      ), # close of tab 2
      
      # GitHub Widget Tab last ----
      tabPanel(
        value = "CustomRightTabPanelGitHub",
        title = a(
          id = "github_id",
          title = 'GitHub',
          href = "https://github.com/mayank7jan/live-Knit-Rmd",
          target = "_blank",
          icon('github')
        )
      ) # close tabPanel GitHub
      
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
    tags$script(src = 'ace-shiny.js', type = 'text/javascript'),
    tags$script(src = 'shiny.js', type = 'text/javascript')
  
    
  ) # close top level fluidPage
) #close shinyUI