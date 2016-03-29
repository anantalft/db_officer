module DbOfficer
  class MyValidator < ActiveModel::Validator
    def validate(record)
      # if some_complex_logic
      #   record.errors.add :base, 'This record is invalid'
      # end
      record.errors.add(:base, "already exists. Please provide different name.") if Table.app_tables.include?(record)
    end
  end
end
