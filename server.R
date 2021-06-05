server <- function(input, output, session) {
  
  # show/hide app theme selector
  observeEvent(input$appThemeToggle,{
    if(isTRUE(input$appThemeToggle)){
      CustomJS$show(id = "AppThemeSelector")
    } else {
      CustomJS$hide(id = "AppThemeSelector")
    }
  })
  
  
  ################################################################################################################
  # Tab 1 - View ----
  ################################################################################################################
  
  ## enable aceEditor additional functionalities
  aceAutocomplete("rmdView")
  aceTooltip("rmdView")
  
  # update Example selection
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
  
  
  ## Download Button Handlers
  
  output$DownloadRmd <- downloadHandler(
    filename = function() {
      paste0("Blog_",Sys.Date(),".Rmd")
    },
    content = function(file) {
      writeLines(text = input$rmd, con = file)
    }
  )
  
  output$DownloadHTML <- downloadHandler(
    filename = function() {
      paste0("Blog_View_",Sys.Date(),".html")
    },
    content = function(file) {
      writeLines(
        text = knitr::knit2html(
          text = input$rmd,
          fragment.only = TRUE,
          quiet = TRUE
        ),
        con = file
      )
    }
  )
  

} # close server