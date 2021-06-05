server <- function(input, output, session) {
  
  ################################################################################################################
  # Tab 1 - View ----
  ################################################################################################################
  
  ## enable aceEditor additional functionalities
  aceAutocomplete("rmdView")
  aceTooltip("rmdView")
  
  observeEvent(input$editorExampleView,{
    # works
    updateAceEditor(session = session, editorId = "rmdView", value = paste(readLines(file.path("R",input$editorExampleView)), collapse = "\n"), border = "flash")
  }, ignoreInit = TRUE)
  
  # update AceEditor Theme based on selection ----
  observeEvent(input$aceThemeView,{
    updateAceEditor(session = session, editorId = "rmdView", theme = input$aceThemeView)
  }, ignoreInit = FALSE)
  
  
  # Knit HTML document continously RHS ----
  output$knitDocView <- renderUI({
    # input$eval
    if (length(input$rmdView) == 0L || input$rmdView == '')
      return(NULL)
    
    HTML(
      knitr::knit2html(
        # text = isolate(input$rmd),
        text = input$rmdView,
        fragment.only = TRUE,
        quiet = TRUE
      ),
      '<script>',
      'MathJax.Hub.Queue(["Typeset", MathJax.Hub]); // update MathJax expressions',
      '</script>'
    )
    
  })
  
  
  ################################################################################################################
  # Tab 2 - Create ----
  ################################################################################################################
  
  ## enable aceEditor additional functionalities
  aceAutocomplete("rmd")
  aceTooltip("rmd")
  # aceAnnotate("rmd")
  
  # observeEvent(input$editorExample,{
  #   # works
  #   updateAceEditor(session = session, editorId = "rmd", value = paste(readLines(file.path("R",input$editorExample)), collapse = "\n"), border = "flash")
  # }, ignoreInit = TRUE)
  
  # update AceEditor Theme based on selection ----
  observeEvent(input$aceTheme,{
    updateAceEditor(session = session, editorId = "rmd", theme = input$aceTheme)
  }, ignoreInit = FALSE)
  
  
  # Knit HTML document continously RHS ----
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
  

} # close server