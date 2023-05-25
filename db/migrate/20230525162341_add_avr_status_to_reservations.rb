class AddAvrStatusToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :avr_status, :string
  end
end
