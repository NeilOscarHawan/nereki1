class CreateAvrs < ActiveRecord::Migration[7.0]
  def change
    create_table :avrs do |t|
      t.string :avr_name
      t.boolean :avr_status
      t.timestamps
    end
  end
end
