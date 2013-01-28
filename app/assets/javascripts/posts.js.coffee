# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

dataSource = []
map = {}
selectedTags = []

selectTag = (tagId, tagName) ->
  return unless selectedTags.indexOf(tagId) == -1
  tag = $('#tag_template').clone()
  tag.show()
  tag.attr('id', 'tag_' + $('#tags_pool').children().length)
  tag.data('id', tagId)
  tag.find('span').html(tagName)
  selectedTags.push tagId
  $('#tags').val(selectedTags.join(','))

  tag.find('button').click (event) ->
    tag.remove()
    selectedTags.splice(selectedTags.indexOf(tagId), 1)
    $('#tags').val(selectedTags.join(','))

  $('#tags_pool').append(tag)
  
tags_handle = () ->
  $(document).ready ->
    data = $('#tags_data_source').data('source')

    $.each data, (i, object) ->
      map[object.name] = object
      dataSource.push object.name

    $.each $('#selected_tags').data('source'), (i, selectedTag) ->
      selectTag(selectedTag.id, selectedTag.name)

    $("#tag_input").typeahead
      source: dataSource
      minLength: 1
      items: 3

      updater: (item) ->
        selectTag map[item].id, map[item].name
        ''

window.MF_BLOG.posts =
  'new': ->
    tags_handle()
  'edit': ->
    tags_handle()

