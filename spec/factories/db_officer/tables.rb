FactoryGirl.define do
  factory :table, class: "DbOfficer::Table" do
    skip_create
    name {Faker::Name.table_name}
    association :table_columns, factory: :table_column
  end
end

