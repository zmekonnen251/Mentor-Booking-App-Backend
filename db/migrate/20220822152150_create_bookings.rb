class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :country, null: false
      t.string :city, null: false
      t.references :user, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
