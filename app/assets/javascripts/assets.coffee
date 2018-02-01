$(document).ready ->
  $("#department").on "change", ->
    department_id = $("#department").val()
    $.ajax
      url: '/departments/' + department_id
      type: 'GET'
      data: {}
      success: (data) ->
        $('#asset_course_id').html("")
        $('#asset_lecturer_id').html("")
        for c in data.courses
          $('#asset_course_id').append(new Option(c.course_description, c.id))
        for l in data.lecturers
          $('#asset_lecturer_id').append(new Option(l.firstname + " " + l.lastname, l.id))


$(document).ready ->
  $('#link').on 'click',->
    asset_id = $(this).attr('asset_id')
    user_id = $(this).attr('user_id')

    obj = {
      download: {
        user_id: user_id,
        asset_id: asset_id
      }
    }

    $.ajax
      url: '/downloads'
      type: 'POST'
      data: obj
      success: ->
        console.log 'Committed'

$(document).ready ->
  $("#link").on "click", ->
    alert('Thank you for downloading please remember to upload files to keep the community growing')
