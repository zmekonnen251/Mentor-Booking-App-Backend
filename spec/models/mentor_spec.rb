require 'rails_helper'

RSpec.describe Mentor, type: :model do
  subject do
    described_class.new(id: 1, email: 'mentor@yahoo.com', password: 'password', bio: 'my self', name: 'ismail')
  end

  it 'is valid with name' do
    subject.name = 'ismail'
    expect(subject).to be_valid
  end

  it 'is valid with email' do
    subject.email = 'mentor@yahoo.com'
    expect(subject).to be_valid
  end

  it 'is valid with name' do
    subject.password = 'password'
    expect(subject).to be_valid
  end

  it 'is valid with bio' do
    subject.bio = 'bio'
    expect(subject).to be_valid
  end

end
