window.MF_BLOG =
  common:
    init: ->
      # Application specific code here


UTIL =
  exec: (controller, action) ->
    ns = MF_BLOG
    action = (if (action is `undefined`) then "init" else action)
    ns[controller][action]()  if controller isnt "" and ns[controller] and typeof ns[controller][action] is "function"

  init: ->
    body = document.body
    controller = body.getAttribute("data-controller")
    action = body.getAttribute("data-action")
    UTIL.exec "common"
    UTIL.exec controller
    UTIL.exec controller, action

$(document).ready UTIL.init
