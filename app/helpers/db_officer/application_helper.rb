module DbOfficer
  module ApplicationHelper
    def link_to_add_fields(name, f, association)
      new_object = TableColumn.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do
      |builder|
        render("field_fields", f: builder)
      end
      link_to(("<i class='fa fa-plus-circle fa-lg' aria-hidden='true'></i>"+ name).html_safe, '#', class: "add_fields", data: {id: id, repi: '][', fields: fields.gsub("\n", "")})
    end
  end
end

