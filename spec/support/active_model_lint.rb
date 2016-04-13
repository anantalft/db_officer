#require 'lib/amo_lint_extensions'
# put the file into spec/support
shared_examples_for "ActiveModel" do
  include ActiveModel::Lint::Tests

  # to_s is to support ruby-1.9
  ActiveModel::Lint::Tests.public_instance_methods.map{|m| m.to_s}.grep(/^test/).each do |m|
    example m.gsub('_',' ') do
      send m
    end
  end

  def model
    subject
  end
end

#https://github.com/datamapper/dm-active_model/blob/master/spec/amo_validation_compliance_spec.rb
# shared_examples_for 'ActiveModelValidation' do
#   include ActiveModel::Lint::Tests::Validations
#
#   ActiveModel::Lint::Tests::Validations::VALIDATION_METHODS.each do |validation_method|
#     it "must implement the .#{validation_method} interface" do
#       send("test_#{validation_method}")
#     end
#   end
# end
