require 'rails_helper'


RSpec.describe Like, type: :model do
  
 let(:mentor) {Mentor.create(email: 'user@yahoo.com', password: 'password', name: 'mentor')}
 let(:user) {User.create(email: 'user@yahoo.com', password: 'password', name: 'user')}
  subject{Like.create(id: 1, mentor_id: mentor.id, user_id: user.id)}

  
  it "should correctly identify the user relationship" do
    subject.user_id = user.id
    expect(subject).to be_valid    
  end

  it "should correctly identify the mentor relationship" do
    subject.mentor_id = mentor.id
    expect(subject).to be_valid    
  end
end
