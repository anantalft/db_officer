module DbOfficer
  class Generator

    def self.create_table_script(table)
"class Create#{table.name.capitalize} < ActiveRecord::Migration
  def change
    create_table :#{table.name.downcase} do |t|
      t.#{table.table_columns[0].field_type} :#{table.table_columns[0].name}
      t.timestamps
    end
  end
end"
    end

    def self.file_name_for_create(table_name)
      "#{DateTime.now.strftime("%Y%m%d%H%M%S")}_create_#{table_name}.rb"
    end

  end
end
