//= require active_admin/base
//= require jquery.tagit
//= require ckeditor-jquery
//= require ckeditor_config
//= require_self

var CKEDITOR_BASEPATH = '/assets/ckeditor/';

$(document).ready(function() {
  if ($('body').hasClass('admin_posts')) {
    if ($('body').hasClass('edit') || $('body').hasClass('new')) {
      // post#edit || post#new only
      $('#post_tag_ids').tagit({
        availableTags: $('#tag-list-data').data('tag-list'),
        allowSpaces: true,
      });
    }
  }
});
