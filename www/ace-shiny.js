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
  
  });
});
