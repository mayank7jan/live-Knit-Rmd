Shiny.addCustomMessageHandler("element_display_id",
  function(ele_i) {
     document.getElementById(ele_i.id).style.display = ele_i.display;
});


/*Change icon for HTML file download button*/

$(document).on('shiny:connected', function(event) {
  $(document).ready(function() {
    var downloadHTML = document.getElementById('DownloadHTML');
    var HTMLinner = downloadHTML.getElementsByTagName('i');
    HTMLinner[0].className = "fa fa-file-download";
  });
});


/*Tab Links display to none*/
var CustomRightTabPanel = $('a[data-value^="CustomRightTabPanel"]');
if( CustomRightTabPanel.length > 0 ) {
  CustomRightTabPanel.each(function () {
        $( this )[0].style.display = "none";
        $( this ).parent().addClass('Custom-tabPanel-right');
   });
}

