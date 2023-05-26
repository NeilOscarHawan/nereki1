class AddDescriptionToAvrs < ActiveRecord::Migration[7.0]
  def up
    add_column :avrs, :avr_desc, :string
  end

  def down
    remove_column :avrs, :avr_desc
  end
end
