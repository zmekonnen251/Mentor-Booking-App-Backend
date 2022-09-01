require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject do
    described_class.new(id: 1, email: 'test@gmail.com', password: 'password', name: 'ismail', role: 'user')
  end

  it 'is not valid with a name' do
    subject.name = 'ismail'
    expect(subject).to be_valid
  end

  it 'is not valid with an email' do
    subject.email = 'test@gmail.com'
    expect(subject).to be_valid
  end

  it 'is not valid with password' do
    subject.password = 'password'
    expect(subject).to be_valid
  end
  it 'should have a default role value of user' do
    subject.role = 'user'
    expect(subject).to be_valid
  end

end
