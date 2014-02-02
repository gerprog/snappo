$(function() {
  $("#challengers_search input").keyup(function() {
    $.get($("#challengers_search").attr("action"), $("#challengers_search").serialize(), null, "script");
    return false;
  });
});