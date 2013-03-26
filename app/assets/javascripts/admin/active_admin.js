//= require active_admin/base
//= require jquery.tagit
//= require ckeditor-jquery
//= require ckeditor_config
//= require jquery-fileupload/vendor/jquery.ui.widget
//= require jquery-fileupload/jquery.fileupload
//= require ./direct_upload
//= require_self

var CKEDITOR_BASEPATH = '/assets/ckeditor/';

$(document).ready(function() {
  body_tag = $('body')
  if (body_tag.hasClass('admin_posts')) { // posts controller

    if (body_tag.hasClass('edit') || body_tag.hasClass('new')) {
      // post#edit || post#new only
      $('#post_tag_ids').tagit({
        availableTags: $('#tag-list-data').data('tag-list'),
        allowSpaces: true,
      });

      $("#post-img-uploader").css("top", $("#post_image").position().top + "px");
      $("#post-img-uploader").css("left", $("#post_image").position().left + "px");
      handle_direct_upload("#post-img-uploader", "#post_image");
    }

  } else if (body_tag.hasClass('admin_profiles')) { // profiles controller

    if (body_tag.hasClass('edit') || body_tag.hasClass('new')) {
      // profile#edit || profile#new
      $("#profile-img-uploader").css("top", $("#profile_avatar").position().top + "px");
      $("#profile-img-uploader").css("left", $("#profile_avatar").position().left + "px");
      handle_direct_upload("#profile-img-uploader", "#profile_avatar");


    }

  }
});
