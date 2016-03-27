module DbOfficer
  class Generator

    def self.create_table_script(table)
    temp = ""
    temp =  "class Create#{table.name.capitalize} < ActiveRecord::Migration\n"
    temp+=  "\t def change\n"
    temp+=  "\t\tcreate_table :#{table.name.downcase} do |t|\n"
    table.table_columns.each do |table_column|
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

  end
end
