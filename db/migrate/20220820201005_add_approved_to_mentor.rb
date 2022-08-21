class AddApprovedToMentor < ActiveRecord::Migration[7.0]
  def change
    add_column :mentors, :approved, :boolean, null: false, default: false
    add_index :mentors, :approved
  end

  def self.down
    remove_column :mentors, :approved
    remove_index :mentors, :approved
  end
end
