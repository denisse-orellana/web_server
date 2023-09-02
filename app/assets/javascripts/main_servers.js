$(document).on('ready turbolinks:load', function(){
  loadMainServerTable();
});

function loadMainServerTable() {
  if ($('#main-server-table').length) {
    $.ajax({
      type: 'GET',
      url: $('#main-server-table').data('url'),
      dataType: 'script'
    })
  }
}
