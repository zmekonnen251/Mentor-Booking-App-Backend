class CreateAllowListedJwts < ActiveRecord::Migration[7.0]
  def change
    create_table :allowlisted_jwts do |t|
      t.string :jti, null: false
      t.string :aud
      t.datetime :exp, null: false
      t.string :remote_ip
      t.string :browser_data
      t.string :os_data
      t.string :device_data
      t.timestamps null: false
    end
    
    add_reference :allowlisted_jwts, :user, foreign_key: {to_table: :users, on_delete: :cascade}
    add_index :allowlisted_jwts, :jti, unique: true
  end
end
