window.handle_direct_upload = ->
  $(".direct-upload").each ->
    form = $(this)
    $(this).fileupload
      url: form.attr("action")
      type: "POST"
      autoUpload: true
      dataType: "xml" # This is really important as s3 gives us back the url of the file in a XML document
      add: (event, data) ->
        data.submit()

      send: (e, data) ->
        $(".progress").fadeIn()

      progress: (e, data) ->
        # This is what makes everything really cool, thanks to that callback
        # you can now update the progress bar based on the upload progress
        percent = Math.round((e.loaded / e.total) * 100)
        $(".bar").css "width", percent + "%"

      fail: (e, data) ->
        console.log "fail"

      success: (data) ->
        # Here we get the file url on s3 in an xml doc
        url = $(data).find("Location").text()
        $("#real_file_url").val url # Update the real input in the other form

      done: (event, data) ->
        $(".progress").fadeOut 300, ->
          $(".bar").css "width", 0
