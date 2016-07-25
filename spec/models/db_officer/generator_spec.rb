require 'rails_helper'

module DbOfficer
  RSpec.describe Generator, type: :model do
    let(:table) { build(:table) }

    describe "create table" do
      describe ".create_table_script" do
        it "generates a script to create a table " do
          temp = ""
          temp =  "class Create#{table.name.capitalize} < ActiveRecord::Migration\n"
          temp+=  "\t def change\n"
          temp+=  "\t\tcreate_table :#{table.name.downcase} do |t|\n"
          Array(table.table_columns).each do |table_column|
            temp+=  "\t\t\t t.#{table_column.field_type} :#{table_column.name}\n"
          end
          temp+=  "\t\t\t t.timestamps \n"
          temp+= "\t\t end \n"
          temp+= "\t end \n"
          temp+= "end \n"
          expect(Generator.create_table_script(table)).to eq(temp)
        end
      end

      describe ".file_name_for_create" do
        it "generates the file name for creating a table" do
          expect(Generator.file_name_for_create(table.name)).to end_with ("_create_#{table.name.downcase}.rb")
        end
      end

      describe ".create_migration_file" do
        it "creates the migration file" do
          file = Generator.file_name_for_create(table.name)
          path = Rails.root.join('test/test_files') + file
          Generator.create_migration_file(table,path)
          expect(File.exist?(path)).to be_truthy
        end
      end
    end

    describe "update column" do
      before :each do
        @table1 = Table.new(name: 'test', table_columns:[TableColumn.new({name:"abc", field_type: "integer"})])
        @new_table_column =TableColumn.new({name:"bca", field_type: "integer"})
      end
      describe ".change_table_column" do
        it "generates a script to create a table " do
          class_name = "#{Generator.file_class_name_for_change_col(@table1.name, @table1.table_columns[0].name,@new_table_column)}"
          temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
          temp+= "\tdef change\n"
          temp+= "\t\tchange_column :#{@table1.name}, :#{@table1.table_columns[0].name}, :#{@new_table_column.field_type}\n"
          temp+="\t\trename_column :#{@table1.name}, :#{@table1.table_columns[0].name}, :#{@new_table_column.name}\n"
          temp+= "\tend\n"
          temp+= "end\n"
          expect(Generator.change_table_column(@table1.name, @table1.table_columns[0].name,@new_table_column)).to eq(temp)
        end
      end

      describe ".file_name_for_column_change" do
        it "generates the file name for updating the column" do
          expect(Generator.file_name_for_column_change(@table1.name, @table1.table_columns[0].name,@new_table_column)).to end_with (".rb")
        end
      end

      describe ".file_class_name_for_change_col" do
       it "return file name or classs name for change column" do
         expect(Generator.file_class_name_for_change_col(@table1.name, @table1.table_columns[0].name,@new_table_column)).to eq ("change_#{@table1.table_columns[0].name}_in_#{@table1.name.downcase}_to_#{@new_table_column.name}_#{@new_table_column.field_type}")
       end
      end

      describe ".create_change_column_file" do
        it "creates the change column file" do
          file = Generator.file_name_for_column_change(@table1.name, @table1.table_columns[0].name,@new_table_column)
          path = Rails.root.join('test/test_files') + file
          Generator.create_change_column_file(@table1.name, @table1.table_columns[0].name,@new_table_column,path)
          expect(File.exist?(path)).to be_truthy
        end
      end
    end

    describe "edit table" do
      before :each do
        @table2 = Table.new(name: 'test', table_columns:[TableColumn.new({name:"abc", field_type: "integer"})])
        @org_table_columns =[TableColumn.new({name:"bca", field_type:
        "integer"})]
        @class_suffix = Utils.rand_string
      end
      describe ".edit_table_script" do
         it "generates a script to edit table" do
           count = 0
           class_name = "#{Generator.file_class_name_for_edit_table(@table2.name,@class_suffix)}"
           temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
           temp+= "\tdef change\n"
           Array(@table2.table_columns).each do |table_column|
             if table_column._destroy.eql?("")
               if count > @org_table_columns.count-1
                 temp+= "\t\tadd_column :#{@table2.name}, :#{table_column.name}, :#{table_column.field_type}\n"
               else
                 if @org_table_columns[count].field_type.downcase != table_column.field_type.downcase  || @org_table_columns[count].name.downcase != table_column.name.downcase

                   temp+="\t\trename_column :#{table.name}, :#{org_table_columns[count].name}, :#{table_column.name}\n"
                   temp+= "\t\tchange_column :#{table.name}, :#{table_column.name}, :#{table_column.field_type}\n"
                 end
               end
             else
               if count <= @org_table_columns.count-1
                 temp+= "\t\tremove_column :#{@table2.name}, :#{@org_table_columns[count].name}, :#{@org_table_columns[count].field_type}\n"
               end
             end
             count+= 1
           end
           temp+= "\tend\n"
           temp+= "end\n"
           expect(Generator.edit_table_script(@table2,@org_table_columns,@class_suffix)).to eq(temp)
         end
      end

      describe ".file_name_edit_table" do
        it "generates the file name for updating the table" do
          expect(Generator.file_name_edit_table(@table2,@class_suffix)).to end_with (".rb")
        end
      end

      describe ".file_class_name_for_edit_table" do
        it "return file name or classs name for edit table" do
          expect(Generator.file_class_name_for_edit_table(@table2.name, @class_suffix)).to eq ("edit_#{@table2.name}_columns_#{@class_suffix}")
        end
      end

      describe ".create_edit_table_file" do
        it "creates the edit table file" do
          file = Generator.file_name_edit_table(@table2,@class_suffix)
          path = Rails.root.join('test/test_files') + file
          Generator.create_edit_table_file(path,@table2,@org_table_columns,@class_suffix)
          expect(File.exist?(path)).to be_truthy
        end
      end

    end

    describe "drop table" do
      before :each do
        @table3 = Table.new(name: 'test', table_columns:[TableColumn.new({name:"abc", field_type: "integer"})])
      end
      describe ".drop_table_script" do
        it "generate a script to drop table" do
          class_name = "#{Generator.file_class_name_drop_table(@table3.name)}"
          temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
          temp+= "\tdef change\n"
          temp+= "\t\tdrop_table :#{@table3.name}\n"
          temp+="\tend\n"
          temp+= "end\n"
          expect(Generator.drop_table_script(@table3.name)).to eq(temp)
        end
      end
      describe ".file_name_drop_table" do
        it "generates the file name for dropping the table" do
          expect(Generator.file_name_drop_table(@table3.name)).to end_with (".rb")
        end
      end
      describe ".file_class_name_drop_table" do
        it "return file name or classs name for drop table" do
          expect(Generator.file_class_name_drop_table(@table3.name)).to eq ("drop_#{@table3.name}_table")
        end
      end
      describe ".create_drop_table_file" do
        it "creates the edit table file" do
          file = Generator.file_name_drop_table(@table3.name)
          path = Rails.root.join('test/test_files') + file
          Generator.create_drop_table_file(path,@table3.name)
          expect(File.exist?(path)).to be_truthy
        end
      end
    end

    describe "drop column" do
      before :each do
        @table4 = Table.new(name: 'test', table_columns:[TableColumn.new({name:"abc", field_type: "integer"})])
      end
      describe ".drop_table_column_script" do
        it "generate a script to drop table column" do
          class_name = "#{Generator.file_class_name_drop_table_column(@table4.name, @table4.table_columns[0].name)}"
          temp ="class #{Utils.camelize(class_name)} <ActiveRecord::Migration\n"
          temp+= "\tdef change\n"
          temp+= "\t\tremove_column :#{@table4.name}, :#{@table4.table_columns[0].name}\n"
          temp+="\tend\n"
          temp+= "end\n"
          expect(Generator.drop_table_column_script(@table4.name, @table4.table_columns[0].name)).to eq(temp)
        end
      end

      describe ".file_name_drop_table_column(table_name,column_name)" do
        it "generates the file name for dropping the table column" do
          expect(Generator.file_name_drop_table_column(@table4.name, @table4.table_columns[0].name)).to end_with (".rb")
        end
      end

      describe ".file_class_name_drop_table_column(table_name,column_name)" do
        it "return file name or classs name for dropping table column" do
          expect(Generator.file_class_name_drop_table_column(@table4.name, @table4.table_columns[0].name)).to eq ("remove_#{@table4.table_columns[0].name}_from_#{@table4.name}")
        end
      end

      describe ".create_drop_table_column_file(path,table_name, column_name)" do
        it "creates the edit table file" do
          file = Generator.file_name_drop_table_column(@table4.name, @table4.table_columns[0].name)
          path = Rails.root.join('test/test_files') + file
          Generator.create_drop_table_column_file(path,@table4.name, @table4.table_columns[0].name)
          expect(File.exist?(path)).to be_truthy
        end
      end
    end

  end
end
