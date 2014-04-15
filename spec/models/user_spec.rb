require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :handle }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :handle }

  it 'sends a welcome email' do
    user = User.new
    expect(UserMailer).to receive(:send_welcome_message).with(user)
    user.save
  end
end

