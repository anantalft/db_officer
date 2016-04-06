require_dependency 'db_officer/utils'
module DbOfficer
  class Generator
    include DbOfficer::Utils

    def self.create_table_script(table)
      class_name = "create_#{table.name}"
    temp = ""
    temp =  "class #{Utils.camelize(class_name)} < ActiveRecord::Migration\n"
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
      "#{Utils.file_name_prefix}create_#{table_name.downcase}.rb"
    end

    def self.create_migration_file(table,path)
      Utils.create_file(path,create_table_script(table))
    end

    def self.change_table_column(table_name, column_changed,column_temp)
      class_name = "change_#{column_changed.capitalize}_in_#{table_name.capitalize}"
      temp = ""
      temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
      temp+= "\tdef change\n"
      temp+= "\t\tchange_column :#{table_name}, :#{column_changed}, :#{column_temp.field_type}\n"
      temp+="\t\trename_column :#{table_name}, :#{column_changed}, :#{column_temp.name}\n"
      temp+="\tend\n"
      temp+="end\n"
    end

    def self.file_name_for_column_change(table_name, column_changed)
      "#{Utils.file_name_prefix}change_#{column_changed}_in_#{table_name.downcase}.rb"
    end

    def self.create_change_column_file(table_name, column_changed,column_temp, path)
      Utils.create_file(path,change_table_column(table_name, column_changed,column_temp))
    end
  end
end
