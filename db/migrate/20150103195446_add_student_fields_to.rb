class AddStudentFieldsTo < ActiveRecord::Migration
  def change
    add_column :drives, :student_fields, :text
  end
end
