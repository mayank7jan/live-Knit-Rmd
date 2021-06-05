server <- function(input, output, session) {
  
  ## enable aceEditor additional functionalities
  aceAutocomplete("rmd")
  aceTooltip("rmd")
  # aceAnnotate("rmd")
  
  # update AceEditor Theme based on selection ----
  observeEvent(input$aceTheme,{
    updateAceEditor(session = session, editorId = "rmd", theme = input$aceTheme)
  }, ignoreInit = TRUE)
  
  observeEvent(input$editorExample,{
    
    initRmdExample <- readLines(file.path("R",input$editorExample))
  
    output$rmdUIspace <- renderUI({
      
      aceEditor(outputId = "rmd",
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
      
    })
  
  })
  
  
  # Knit HTML document continously ----
  output$knitDoc <- renderUI({
    # input$eval
    if (length(input$rmd) == 0L || input$rmd == '')
      return(NULL)
    
    HTML(
      knitr::knit2html(
        # text = isolate(input$rmd),
        text = input$rmd,
        fragment.only = TRUE,
        quiet = TRUE
      ),
      '<script>',
      'MathJax.Hub.Queue(["Typeset", MathJax.Hub]); // update MathJax expressions',
      '</script>'
    )
    
  })

}