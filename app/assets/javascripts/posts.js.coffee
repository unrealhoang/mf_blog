# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

dataSource = []
map = {}
selectedTags = []

selectTag = (tagName) ->
  return unless selectedTags.indexOf(tagName) == -1
  return if tagName.length == 0

  tag = $('#tag_template').clone()
  tag.show()
  tag.attr('id', 'tag_' + $('#tags_pool').children().length)
  tag.find('span').html(tagName)
  selectedTags.push tagName
  $('#tags').val(selectedTags.join(','))

  tag.find('button').click (event) ->
    tag.remove()
    selectedTags.splice(selectedTags.indexOf(tagName), 1)
    $('#tags').val(selectedTags.join(','))

  $('#tags_pool').append(tag)
  
tags_handle = () ->
  $(document).ready ->
    dataSource = $('#tags_data_source').data('source')

    $.each $('#selected_tags').data('source'), (i, selectedTag) ->
      selectTag(selectedTag)

    $("#tag_input").typeahead
      source: dataSource
      minLength: 1
      items: 3

      updater: (item) ->
        selectTag item
        ''

window.MF_BLOG.posts =
  'new': ->
    tags_handle()
  'edit': ->
    tags_handle()
