class AddSlotsAndStatusToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :slots, :integer
    add_column :reservations, :res_status, :string
end
end
