require_dependency 'db_officer/utils'
require 'pry'
module DbOfficer
  class Generator
    include DbOfficer::Utils

    ###create table########################################
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

    ### update column####

    def self.change_table_column(table_name, column_changed,column_temp)
      class_name = "#{file_class_name_for_change_col(table_name, column_changed,column_temp)}"
      temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
      temp+= "\tdef change\n"
      temp+= "\t\tchange_column :#{table_name}, :#{column_changed}, :#{column_temp.field_type}\n"
      temp+="\t\trename_column :#{table_name}, :#{column_changed}, :#{column_temp.name}\n"
      temp+= "\tend\n"
      temp+ "end\n"
    end

    def self.file_name_for_column_change(table_name, column_changed,column_temp)
      "#{Utils.file_name_prefix}#{file_class_name_for_change_col(table_name, column_changed,column_temp)}.rb"
    end

    def self.file_class_name_for_change_col(table_name, column_changed,column_temp)
      "change_#{column_changed}_in_#{table_name.downcase}_to_#{column_temp.name}_#{column_temp.field_type}"
    end

    def self.create_change_column_file(table_name, column_changed,column_temp, path)
      Utils.create_file(path,change_table_column(table_name, column_changed,column_temp))
    end

    ## edit table #######################################
    def self.edit_table_script(table,org_table_columns,class_suffix)
      count = 0
      class_name = "#{file_class_name_for_edit_table(table.name,class_suffix)}"
      temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
      temp+= "\tdef change\n"
      Array(table.table_columns).each do |table_column|
        if table_column._destroy.eql?("")
          if count > org_table_columns.count-1
            temp+= "\t\tadd_column :#{table.name}, :#{table_column.name}, :#{table_column.field_type}\n"
          else
            if org_table_columns[count].field_type.downcase != table_column.field_type.downcase  || org_table_columns[count].name.downcase != table_column.name.downcase

              temp+="\t\trename_column :#{table.name}, :#{org_table_columns[count].name}, :#{table_column.name}\n"
              temp+= "\t\tchange_column :#{table.name}, :#{table_column.name}, :#{table_column.field_type}\n"
            end
          end
        else
          if count <= org_table_columns.count-1
            temp+= "\t\tremove_column :#{table.name}, :#{org_table_columns[count].name}, :#{org_table_columns[count].field_type}\n"
          end
        end
        count+= 1
      end
      temp+= "\tend\n"
      temp+ "end\n"
    end

    def self.file_name_edit_table(table_name,class_suffix)
      "#{Utils.file_name_prefix}#{file_class_name_for_edit_table(table_name,class_suffix)
      }.rb"
    end

    def self.file_class_name_for_edit_table(table_name,class_suffix)
      "edit_#{table_name}_columns_#{class_suffix}"
    end

    def self.create_edit_table_file(path,table,org_table_columns,class_suffix)
      Utils.create_file(path,edit_table_script(table,org_table_columns,class_suffix))
    end

    #########drop table###################################33

    def self.drop_table_script(table_name)
      class_name = "#{file_class_name_drop_table(table_name)}"
      temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
      temp+= "\tdef change\n"
      temp+= "\t\tdrop_table :#{table_name}\n"
      temp+="\tend\n"
      temp+ "end\n"
    end

    def self.file_name_drop_table(table_name)
      "#{Utils.file_name_prefix}#{file_class_name_drop_table(table_name)}.rb"
    end

    def self.file_class_name_drop_table(table_name)
      "drop_#{table_name}_table"
    end

    def self.create_drop_table_file(path,table_name)
      Utils.create_file(path,drop_table_script(table_name))
    end

    ##########drop column########################
    def self.drop_table_column_script(table_name, column_name)
      class_name = "#{file_class_name_drop_table_column(table_name,column_name)}"
      temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
      temp+= "\tdef change\n"
      temp+= "\t\tremove_column :#{table_name}, :#{column_name}\n"
      temp+="\tend\n"
      temp+ "end\n"
    end

    def self.file_name_drop_table_column(table_name,column_name)
      "#{Utils.file_name_prefix}#{file_class_name_drop_table_column(table_name,column_name)}.rb"
    end

    def self.file_class_name_drop_table_column(table_name,column_name)
      "remove_#{column_name}_from_#{table_name}"
    end

    def self.create_drop_table_column_file(path,table_name, column_name)
      Utils.create_file(path,drop_table_column_script(table_name,column_name))
    end
  end
end
