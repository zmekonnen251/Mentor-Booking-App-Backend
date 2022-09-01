require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:mentor) {Mentor.create(email: 'mentor@yahoo.com', password: 'password', name: 'mentor')}
  let(:user) {User.create(email: 'user@yahoo.com', password: 'password', name: 'user')}

  subject do
    described_class.new(date: '2022-09-01', country: 'nigeria', city: 'lagos', user_id: user.id, mentor_id: mentor.id)
  end

  it "should correctly identify the mentor relationship" do
    subject.mentor_id = mentor.id
    expect(subject).to be_valid    
  end

  it "should correctly identify the user relationship" do
    subject.user_id = user.id
    expect(subject).to be_valid    
  end

  it "should not be valid without date " do
    subject.date = ''
    expect(subject).to_not be_valid    
  end

  it "should be valid with country " do
    subject.country = 'nigeria'
    expect(subject).to be_valid    
  end

  it "should be valid with city " do
    subject.city = 'lagos'
    expect(subject).to be_valid    
  end
 
end
