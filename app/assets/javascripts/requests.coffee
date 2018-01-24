$(document).ready ->
  $("#department").on "change", ->
    department_id = $("#department").val()
    $.ajax
      url: '/departments/' + department_id
      type: 'GET'
      data: {}
      success: (data) ->
        $('#request_course_id').html("")
        $('#request_lecturer_id').html("")
        for c in data.courses
          $('#request_course_id').append(new Option(c.course_description, c.id))
        for l in data.lecturers
          $('#request_lecturer_id').append(new Option(l.firstname + " " + l.lastname, l.id))
