Shiny.addCustomMessageHandler("element_display_id",
  function(ele_i) {
     document.getElementById(ele_i.id).style.display = ele_i.display;
});