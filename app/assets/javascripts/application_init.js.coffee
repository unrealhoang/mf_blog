window.MF_BLOG =
  common:
    init: ->
      # Application specific code here
      ((d, s, id) ->
        js = undefined
        fjs = d.getElementsByTagName(s)[0]
        return  if d.getElementById(id)
        js = d.createElement(s)
        js.id = id
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=414723541929772"
        fjs.parentNode.insertBefore js, fjs
      ) document, "script", "facebook-jssdk"

      $(document).ready ->
        # hide #back-top first
        $("#back-top").hide()
        
        # fade in #back-top
        $ ->
          $(window).scroll ->
            if $(this).scrollTop() > 100
              $("#back-top").fadeIn()
            else
              $("#back-top").fadeOut()
          
          # scroll body to 0px on click
          $("#back-top a").click ->
            $("body,html").animate
              scrollTop: 0
            , 800
            false


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
