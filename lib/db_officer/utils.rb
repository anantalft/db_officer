module DbOfficer
  module Utils
    def self.create_file(path,script)
      File.open(path, "w") do |file|
        file.write(script)
      end
    end

    def self.file_name_prefix
      "#{DateTime.now.strftime("%Y%m%d%H%M%S")}_"
    end

    def self.run_migration(file_path,model_name)
      begin
        ActiveRecord::Migrator.migrate "db/migrate"
      rescue StandardError=> exception
        File.delete(file_path)
        model_name.errors.add(:name,exception)
      end
    end

    def self.migration_file_root_path
      Rails.root.join('db/migrate/')
    end

    def self.camelize(temp_string)
      temp_string.split('_').collect(&:capitalize).join
    end
  end
end
