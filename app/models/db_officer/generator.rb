module DbOfficer
  class Generator

    def self.create_table_script(table)
    temp = ""
    temp =  "class Create#{table.name.capitalize} < ActiveRecord::Migration\n"
    temp+=  "\t def change\n"
    temp+=  "\t\tcreate_table :#{table.name.downcase} do |t|\n"
    Array(table.table_columns).each do |table_column|
      temp+=  "\t\t\t t.#{table_column.field_type} :#{table_column.name}\n"
    end
    temp+=  "\t\t\t t.timestamps \n"
    temp+= "\t\t end \n"
    temp+= "\t end \n"
    temp+= "end \n"
    end

    def self.file_name_for_create(table_name)
      "#{DateTime.now.strftime("%Y%m%d%H%M%S")}_create_#{table_name.downcase}.rb"
    end

    def self.create_migration_file(table,path)
      File.open(path, "w") do |file|
        file.write(create_table_script(table))
      end
    end

    def self.change_table_column(table, table_column, new_table_column)
      temp = ""
      temp ="class ChangeColumnRoleName < ActiveRecord::Migration\n"
      temp+= "\tdef change\n"
      temp+="\t\trename_column :#{table.name}, :#{table_column.name}, :#{new_table_column}\n"
      temp+="\tend\n"
      temp+="end\n"
    end

  end
end
