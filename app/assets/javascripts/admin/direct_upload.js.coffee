window.handle_direct_upload = (form_target, image_field_target) ->
  $(form_target).each ->
    form = $(this)
    $(this).fileupload
      url: form.attr("action")
      type: "POST"
      autoUpload: true
      dataType: "xml" # This is really important as s3 gives us back the url of the file in a XML document
      add: (event, data) ->
        $.each data.files, (index, file) ->
          ext = file.name.slice(-3).toLowerCase()

          ct = switch ext
            when "png" then "image/png"
            when "gif" then "image/gif"
            else "image/jpeg"

          $("#content-type").val(ct)

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
        alert "Failed to upload that file, please try again"

      success: (data) ->
        # Here we get the file url on s3 in an xml doc
        url = $(data).find("Location").text()
        $(image_field_target).val url # Update the real input in the other form
        $("#preview-img").attr("src", url)

      done: (event, data) ->
        $(".progress").fadeOut 300, ->
          $(".bar").css "width", 0
