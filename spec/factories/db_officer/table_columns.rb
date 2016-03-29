FactoryGirl.define do
  factory :table_column, class: "DbOfficer::TableColumn" do
    skip_create
    name {Faker::Name.column_name}
    field_type {Faker::Name.column_type}
  end
end

