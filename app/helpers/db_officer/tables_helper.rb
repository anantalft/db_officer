module DbOfficer
  module TablesHelper

    def link_to_delete(table)
      link_to ("<i class='fa fa-trash' aria-hidden='true'></i> Drop").html_safe,table_path(id: table), method: :delete, data: {confirm: 'Are you sure?' }
    end
    def link_to_edit(table)
      link_to ("<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Change").html_safe, edit_table_path(id: table)
    end

    def link_to_structure(table)
      link_to ("<i class='fa fa-table' aria-hidden='true'></i> Structure").html_safe, root_path(table_name: table)
    end

    def link_to_edit_column(table_name, column_name)
      link_to ("<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Change").html_safe, edit_table_table_column_path(table_id: table_name, id:column_name)
    end

    def link_to_delete_column(table_column,column_name)
      link_to ("<i class='fa fa-trash' aria-hidden='true'></i> Drop").html_safe,table_table_column_path(table_id:table_column,id: column_name), method: :delete, data: {confirm: 'Are you sure?' }
    end
  end
end
