require 'rails_helper'

RSpec.describe MentorTechnology, type: :model do
  let(:mentor) {Mentor.create(email: 'user@yahoo.com', password: 'password', name: 'mentor')}
  let(:technology) {Technology.create(name: 'technology')}
  subject{MentorTechnology.create(mentor_id: mentor.id, technology_id: technology.id)}

   it "should correctly identify the technology relationship" do
    subject.technology_id = technology.id
    expect(subject).to be_valid    
  end

  it "should correctly identify the mentor relationship" do
    subject.mentor_id = mentor.id
    expect(subject).to be_valid    
  end

  
end
