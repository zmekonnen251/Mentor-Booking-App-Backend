# frozen_string_literal: true

class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :email,              null: false, default: ""
      t.string :bio
      t.string :name
      t.string :phone

      t.timestamps null: false
    end

    add_index :mentors, :email,                unique: true
  end
end
