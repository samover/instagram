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

