$(".finder").ready ->
    lookup = new Lookup

class Lookup

    constructor: () ->
        @.set_variables()
        @.user_sets_the_lookup_evnt()
        @.user_searches_for_matches_evnt()
        @.dialog_search_definition()

    set_variables: ->
        @_object_type_to_find = $("#setting_id").html()
        $("#lookup_arguments").remove()

    dialog_search_definition: ->
        $(".finder").not(":eq(0)").remove() #we will maintain only one pop-up box
        $(".finder").dialog({autoOpen: false, width: 500})
        $(document).on "click", ".lookup_icon", ->
            $(".finder").dialog "open"
            $(".finder").attr('student_id', $(this).attr("student_id") )    

    user_sets_the_lookup_evnt: ->
        $("#found_schools").on "click", ".lookup_link", {set_lookup: @set_lookup, foreign_key_field: @_object_type_to_find}, (evt) ->
            console.log "About to set the lookup"
            finder = $(".finder")
            finder.dialog "close"
            evt.data.set_lookup $(".finder").attr("student_id"), $(this).attr("school_id"), evt.data.foreign_key_field

    user_searches_for_matches_evnt: ->
        $("#lookup_search").click {object_type_to_find: @_object_type_to_find}, (evt)->
            console.log "About to search for matches"
            search_txt = $("#search_tag").val();
            $.ajax
                url: "/lookup/",
                type: "get",
                data:
                    "search":search_txt,
                    "obj_type":evt.data.object_type_to_find

    set_lookup: (id, foreign_key, foreign_key_field) ->
        $.ajax
            url: "/students/test",
            type: "post",
            data:
                "foreign_key":foreign_key
                "foreign_key_field":foreign_key_field
                "id":id
            ,
            success: (data, status, xhr) ->
                $('#students_school_id').val( setting_id ).change();
                lookup = new Lookup()
