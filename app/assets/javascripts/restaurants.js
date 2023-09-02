$(document).on('cocoon:after-insert', '#add-device', function() {
  showAndHideAddDeviceButton();
});

$(document).on('cocoon:after-remove', '#add-device', function() {
  showAndHideAddDeviceButton();
});

function showAndHideAddDeviceButton() {
  if ($('#add-device .nested-fields:visible').length == 3) {
    $('#add-device-btn').hide();
  } else {
    $('#add-device-btn').show();
  }
}

$(document).on('ready turbolinks:load', function(){
  loadRestaurantsTable();
});

function loadRestaurantsTable() {
  if ($('#restaurants-table').length) {
    $.ajax({
      type: 'GET',
      url: $('#restaurants-table').data('url'),
      dataType: 'script'
    })
  }
}
