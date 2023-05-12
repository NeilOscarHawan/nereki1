class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :res_name
      t.string :res_type
      t.string :contact_num
      t.date :res_date
      t.string :res_time
      t.string :sched_days
      t.string :avr

      t.timestamps
    end
  end
end
