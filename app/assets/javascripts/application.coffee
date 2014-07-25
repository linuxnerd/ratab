#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require ace-elements.min
#= require bootstrap
#= require ace
#= require turbolinks
#= require jquery-ui-1.10.3.custom.min
#= require jquery.validate.min
#= require jquery.mobile.custom.min
#= require wice_grid
#= require faye
#= require nprogress
#= require nprogress-turbolinks
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
  initNotifySubscribe: () ->
    return if not CURRENT_USER_ACCESS_TOKEN?
    faye = new Faye.Client(FAYE_SERVER_URL)
    notifiy_subscription = faye.subscribe "/notify/#{CURRENT_USER_ACCESS_TOKEN}",(json) ->
      console.log('receive message:'+json.title+'-'+json.content)
      span = $('#notificatioin_count')
      current_count = span.text()
      span.addClass('badge-important') if $.trim(current_count) == '0'
      $('#unread-list').append("<li class='unread-list-item'><a href='/notifications' data-method='get'><span class='msg-body'><span class='msg-title'><span class='blue'><b>#{json.title}</b></span><p>#{json.content}</p></span><span class='msg-time'><i class='icon-time'></i><span> 刚刚</span></span></a></li>")
      span.text(++current_count)
      $('.nav-header').replaceWith("<li class='nav-header'><i class='icon-bell'></i>有#{current_count}条新通知</li>")
    true

# NProgress
NProgress.configure
  showSpinner: false
  speed: 300
  minimum: 0.03
  ease: 'ease'
