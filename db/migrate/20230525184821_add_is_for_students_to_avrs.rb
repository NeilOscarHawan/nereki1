class AddIsForStudentsToAvrs < ActiveRecord::Migration[7.0]
  def up
    add_column :avrs, :is_for_students, :boolean, default: false
  end

  def down
    remove_column :avrs, :is_for_students
  end
end
