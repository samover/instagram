require 'rails_helper'

describe UsersHelper, type: :helper  do
  context '#fetch_username' do
    it 'converts an email to a username given a user_id' do
      user = User.create(email: 'pjackson@gmail.com', password: 'password', password_confirmation: 'password')
      expect(fetch_username user.id).to eq 'pjackson'
    end
  end
end
