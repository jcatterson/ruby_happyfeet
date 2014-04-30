(function() {
  var Lookup;

  Lookup = (function() {
    function Lookup() {
      this.set_variables();
      this.user_sets_the_lookup_evnt();
      this.user_searches_for_matches_evnt();
      this.dialog_search_definition();
    }

    Lookup.prototype.set_variables = function() {
      this._object_type_to_find = $("#setting_id").html();
      this._table_name = $('#table_name').html();
      return $("#lookup_arguments").remove();
    };

    Lookup.prototype.dialog_search_definition = function() {
      $(".finder").not(":eq(0)").remove();
      $(".finder").dialog({
        autoOpen: false,
        width: 500
      });
      return $(document).on("click", ".lookup_icon", function() {
        $(".finder").dialog("open");
        return $(".finder").attr('student_id', $(this).attr("student_id"));
      });
    };

    Lookup.prototype.user_sets_the_lookup_evnt = function() {
      return $("#found_objects").on("click", ".lookup_link", {
        set_lookup: this.set_lookup,
        foreign_key_field: this._object_type_to_find,
        table_name: this._table_name
      }, function(evt) {
        var finder;
        console.log("About to set the lookup");
        finder = $(".finder");
        finder.dialog("close");
        return evt.data.set_lookup($(".finder").attr("student_id"), evt.data.table_name, $(this).attr("lookup_id"), evt.data.foreign_key_field);
      });
    };

    Lookup.prototype.user_searches_for_matches_evnt = function() {
      return $("#lookup_search").click({
        object_type_to_find: this._object_type_to_find
      }, function(evt) {
        var search_txt;
        console.log("About to search for matches");
        search_txt = $("#search_tag").val();
        return $.ajax({
          url: "/lookup/",
          type: "get",
          data: {
            "search": search_txt,
            "obj_type": evt.data.object_type_to_find
          }
        });
      });
    };

    Lookup.prototype.set_lookup = function(id, table_name, foreign_key, foreign_key_field) {
      return $.ajax({
        url: "/lookup/set",
        type: "post",
        data: {
          "foreign_key": foreign_key,
          "foreign_key_field": foreign_key_field,
          "id": id,
          "table_name": table_name
        },
        success: function(data, status, xhr) {
          return $('#objects_lookup_id').val(foreign_key).change();
        }
      });
    };

    return Lookup;

  })();

  $(function() {
    var lookup;
    console.log("Loading the lookup");
    return lookup = new Lookup();
  });

}).call(this);
