class AddLocationToAvrs < ActiveRecord::Migration[7.0]
  def up
    add_column :avrs, :avr_loc, :string
  end

  def down
    remove_column :avrs, :avr_loc
  end
end
