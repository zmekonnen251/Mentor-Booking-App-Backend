class CreateMentorTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :mentor_technologies do |t|
      t.references :mentor, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
