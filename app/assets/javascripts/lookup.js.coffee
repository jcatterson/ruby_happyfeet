$ ->
    $(document).on "click", ".lookup_link", ->
        finder = $(".finder")
        finder.dialog "close"
        something( $(".finder").attr("student_id"), $(this).attr("school_id") )

    $(".finder").not(":eq(0)").remove()
    $(".finder").dialog({autoOpen: false, width: 500})
    $(".lookup_icon").click ->
        $(".finder").dialog "open"
        $(".finder").attr('student_id', $(this).attr("student_id") )

something = (id, setting_id)->
    $.ajax
        url: "/students/test",
        type: "post",
        data:
            "setting_id":setting_id
            "id":id
        ,
        success: (data, status, xhr) ->
            $('#students_school_id').val( setting_id ).change();
            console.log "got this far"
            console.log data
            console.log xhr