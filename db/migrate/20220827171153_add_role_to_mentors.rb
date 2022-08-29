class AddRoleToMentors < ActiveRecord::Migration[7.0]
  def change
    add_column :mentors, :role, :string, :default => 'mentor'
  end
end
