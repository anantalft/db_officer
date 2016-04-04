require 'faker'
module Faker
  class Name
    def self.table_name
      name.gsub(/[^a-z]/, '')
    end

    def self.column_name
      name.gsub(/[^a-z]/, '')
    end

    def self.column_type
      ["integer", "string", "text", "datetime", "float", "boolean"].sample
    end
  end
end
