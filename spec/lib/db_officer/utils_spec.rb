require 'rails_helper'
require 'pry'
require_dependency 'db_officer/utils'
module DbOfficer
  RSpec.describe Utils, type: :lib do
    describe ".create_file(path,script)" do
      it "create a file" do
         path = Rails.root.join('test/test_files') + "#{DateTime.now.strftime("%Y%m%d%H%M%S")}_test.txt"
         script = "this is a test"
         Utils.create_file(path,script)
         expect(File.exist?(path)).to be_truthy
      end
    end

    describe ".file_name_prefix" do
      it "return prefix for the migration file name" do
        expect(Utils.file_name_prefix).to eq("#{DateTime.now.strftime("%Y%m%d%H%M%S")}_")
      end
    end
    describe ".run_migration(file_path,model_name)" do
      it "runs the migration" do
        #TODO
      end
    end
    describe ".migration_file_root_path" do
     it "return migration file root path" do
       expect(Utils.migration_file_root_path).to eq(Rails.root.join('db/migrate/'))
     end
    end
    describe ".camelize" do
      it "camelize the given string" do
        expect(Utils.camelize("apple_bapple")).to eq("AppleBapple")
      end
    end
    describe ".rand_string" do
      it "return randons string of length 3" do
        expect(Utils.rand_string.length).to eq(3)
      end
    end
  end
end
