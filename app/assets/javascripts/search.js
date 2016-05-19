$(function(){
  $('#searchText').click(function() {
    $('#searchText').hide('fast');
    $('#searchField').show('slow');
  });
});

$(function(){
  $('#searchField').dblclick(function(){
    $('#searchField').hide('slow');
    $('#searchText').show('slow');
  });
});
