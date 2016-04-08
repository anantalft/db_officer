module DbOfficer
  module TablesHelper

    def link_to_delete(table)
      link_to 'Drop',table_path(id: table), class:"icon-delete", method: :delete, data: {confirm: 'Are you sure?' }
    end
    def link_to_edit(table)
      link_to "Change", edit_table_path(id: table),class:"icon-edit"
    end

    def link_to_structure(table)
      link_to "Structure", root_path(table_name: table),class:"icon-structure"
    end

    def link_to_edit_column(table_name, column_name)
      link_to "Change", edit_table_table_column_path(table_id: table_name, id:column_name), class:"icon-edit"
    end

    def link_to_delete_column()
      link_to 'Drop',"#", class:"icon-delete", method: :delete, data: {confirm: 'Are you sure?' }
    end
  end
end
