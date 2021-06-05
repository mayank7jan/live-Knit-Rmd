$(document).on('shiny:connected', function(event) {
  $(document).ready(function() {
    
    var editor = ace.edit("rmd");
    
    editor.commands.addCommand({
      name: 'insertChunk',
      bindKey: 'Ctrl-Alt-I',
      exec: function(editor) {
        editor.insert('```{r}\n\n```\n');
        editor.navigateUp(2);
      }
    });
    
    var editorView = ace.edit("rmdView");
    
    editorView.commands.addCommand({
      name: 'insertChunk',
      bindKey: 'Ctrl-Alt-I',
      exec: function(editorView) {
        editorView.insert('```{r}\n\n```\n');
        editorView.navigateUp(2);
      }
    });
  
  });
});
