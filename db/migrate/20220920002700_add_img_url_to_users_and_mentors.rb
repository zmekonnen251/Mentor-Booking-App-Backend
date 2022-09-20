class AddImgUrlToUsersAndMentors < ActiveRecord::Migration[7.0]
  def change
    add_column :mentors, :img_url, :string, :default => 'https://p.kindpng.com/picc/s/421-4212356_user-white-icon-png-transparent-png.png'
    add_column :users, :img_url, :string, :default => 'https://p.kindpng.com/picc/s/421-4212356_user-white-icon-png-transparent-png.png'
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
