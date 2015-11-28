require 'rails_helper'

describe UsersHelper, type: :helper  do
  context '#email_to_username' do
    it 'converts an email to a username' do
      email = 'pjackson@gmail.com'
      expect(email_to_username email).to eq 'pjackson'
    end
  end
end
