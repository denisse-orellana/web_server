$(document).on('ready turbolinks:load', function(){
  loadServersTable();
});

function loadServersTable() {
  if ($('#servers-table').length) {
    $.ajax({
      type: 'GET',
      url: $('#servers-table').data('url'),
      dataType: 'script'
    })
  }
}
