#= require jquery
#= require jquery_ujs
#= require ace-elements.min.js
#= require bootstrap.js
#= require ace.js
#= require turbolinks
#= require jquery-ui-1.10.3.custom.min.js
#= require jquery.autosize-min.js
#= require jquery.knob.min.js
#= require jquery.validate.min.js
#= require jquery.dataTables.min.js
#= require jquery.dataTables.bootstrap.js
#= require bootbox.min.js
#= require date-time/bootstrap-datepicker.min.js
#= require fuelux/fuelux.spinner.min.js
#= require additional-methods.min.js
#= require flot/jquery.flot.min.js
#= require flot/jquery.flot.pie.min.js
#= require flot/jquery.flot.resize.min.js
#= require jquery.mobile.custom.min.js
#= require wice_grid
#= require faye
#= require_tree .

window.setTimeout (->
  $("#error_explanation").fadeOut "slow"
  return
), 3000
window.setTimeout (->
  $(".alert").fadeOut "slow"
  return
), 3000

window.App =
  initNotifySubscribe : () ->
    return if not CURRENT_USER_ACCESS_TOKEN?
    faye = new Faye.Client(FAYE_SERVER_URL)
    notifiy_subscription = faye.subscribe "/notify/#{CURRENT_USER_ACCESS_TOKEN}",(json) ->
      
    true