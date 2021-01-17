# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  required_attributes = %i[first_name last_name email]

  required_attributes.each { |field| it { expect(subject).to validate_presence_of(field) } }

  it { expect(subject).to have_secure_password }

  it 'generates password digest from password' do
    user = User.new
    expect(user.password_digest).to be_nil
    user.password = 'password'
    expect(user.password_digest).not_to be_nil
  end
end