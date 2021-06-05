server <- function(input, output, session) {
  
  ## enable aceEditor additional functionalities
  aceAutocomplete("rmd")
  aceTooltip("rmd")
  # aceAnnotate("rmd")
  
  # Insert Ace Editor LHS ----
  # observeEvent(input$editorExample,{
  #   
  #   initRmdExample <- readLines(file.path("R",input$editorExample))
  # 
  #   output$rmdUIspace <- renderUI({
  #     
  #     aceEditor(outputId = "rmd",
  #               mode = "markdown", #"markdown", "r"
  #               value = initRmdExample,
  #               theme = "textmate", #"dreamweaver",
  #               readOnly = FALSE,
  #               fontSize = 12,
  #               wordWrap = TRUE,
  #               debounce = 1000,
  #               showLineNumbers = TRUE,
  #               highlightActiveLine = TRUE,
  #               autoScrollEditorIntoView = TRUE,
  #               minLines = 55,
  #               maxLines = 500,
  #               autoComplete = "enabled",
  #               # autoCompleteList = c("static", "keyword", "rlang", getNamespaceExports('ggplot2'), getNamespaceExports('dplyr'))
  #               autoCompleteList = c("static", "keyword", "rlang")
  #     )
  #     
  #   })
  # 
  # })
  
  observeEvent(input$editorExample,{
    
    # filePath <- file.path("R",input$editorExample)
    # fileChars <- readChar(filePath, nchars = file.info(filePath)$size)
    # # 
    # isolate({
    #   updateAceEditor(session = session, editorId = "rmd", value = fileChars, border = "flash")
    # })
    
    # updateAceEditor(session = session, editorId = "rmd", value = readLines(file.path("R",input$editorExample)), border = "flash")
    
    # works
    updateAceEditor(session = session, editorId = "rmd", value = paste(readLines(file.path("R",input$editorExample)), collapse = "\n"), border = "flash")
    
  }, ignoreInit = TRUE)
  
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

}