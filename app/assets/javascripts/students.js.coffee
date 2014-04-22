# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $(".lookup_icon").click ->
        $(".finder").dialog "open"

    $(".finder").not(":eq(0)").remove()
    $(".finder").dialog({autoOpen: false})

