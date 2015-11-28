require 'rails_helper'

describe 'User can sign in and out' do
  context 'User not signed in' do
    it 'should see sign in and sign up link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not see sign out linke' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'User signed in' do
    it 'should see sign out link' do
      visit '/'
      sign_up
      expect(page).to have_link 'Sign out'
    end

    it 'should not see sign in and sign out link' do
      visit '/'
      sign_up
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end

def sign_up(email: 'psmith@makers.com', password: 'password')
  click_link 'Sign up'
  fill_in 'Email', with: email 
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_out
  click_link 'Sign out'
end
