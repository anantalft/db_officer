module DbOfficer
  class Generator

    def self.create_table_script(table_params)
"class Create#{table_params[:table_name].capitalize} < ActiveRecord::Migration
  def change
    create_table :#{table_params[:table_name].downcase} do |t|
      t.#{table_params[:column_type]} :#{table_params[:column_name]}
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
