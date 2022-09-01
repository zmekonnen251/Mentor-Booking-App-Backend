require 'rails_helper'

RSpec.describe Technology, type: :model do
  subject do
    described_class.new(id: 1, name: 'ruby')
  end

  it 'is valid with name' do
    subject.name = 'ruby'
    expect(subject).to be_valid
  end
end
