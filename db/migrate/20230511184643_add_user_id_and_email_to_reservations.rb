class AddUserIdAndEmailToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :user_id, :integer
    add_index :reservations, :user_id
    add_column :reservations, :user_email, :string
  end
end
