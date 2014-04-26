# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $(".lookup_icon").click ->
        $(".finder").dialog "open"
        $(".finder").attr('student_id', $(this).attr("student_id") )

    $(".finder").not(":eq(0)").remove()
    $(".finder").dialog({autoOpen: false, width: 500})

    $(document).on "click", ".lookup_link", ->
        finder = $(".finder")
        finder.dialog "close"
        test( $(".finder").attr("student_id"), $(this).attr("school_id") )

test = (id, setting_id)->
    $.ajax
        url: "/students/" + id + "/test",
        type: "post",
        data:
            "setting_id":setting_id
