require 'rails_helper'

RSpec.describe AllowlistedMentorsJwt, type: :model do
  let (:allowlisted_mentors_jwts) {AllowlistedMentorsJwt.create(id: 1, jti: 'jti', aud: 'aud', exp: '1 hour',remote_ip: 'ip', browser_data: 'data', os_data: 'os', device_data: 'devise')}
 it 'is valid with jti' do
    subject.jti = 'jti'
    expect(subject).to be_valid
  end

  it 'is valid with devise data' do
    subject.device_data = 'devise'
    expect(subject).to be_valid
  end

  it 'is valid with os data' do
    subject.os_data = 'os'
    expect(subject).to be_valid
  end

  it 'is valid with browser data' do
    subject.browser_data = 'data'
    expect(subject).to be_valid
  end

  it 'is valid with remote ip' do
    subject.remote_ip = 'ip'
    expect(subject).to be_valid
  end

  it 'is valid with exp' do
    subject.exp = '1 hour'
    expect(subject).to be_valid
  end

  it 'should have 1 as valid id' do
    subject.id = 1
    expect(subject).to be_valid
  end

  it 'is valid with aud' do
    subject.aud = 'aud'
    expect(subject).to be_valid
  end




end


