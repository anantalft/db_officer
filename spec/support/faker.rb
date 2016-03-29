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
      [
      ["INTEGER", "integer"],
      ["STRING", "string"],
      ["TEXT", "text"],
      ["DATETIME", "datetime"],
      ["FLOAT", "float"],
      ["BOOLEAN", "boolean"],
      ].sample
    end
  end
end
