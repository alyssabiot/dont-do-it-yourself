class AddDefaultToAcceptedInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :accepted, :string, default: "pending"
  end
end
