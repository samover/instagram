require 'rails_helper'

describe 'features for commenting on posts' do

  context 'creating comments' do
    before do
      sign_up
      post_photo 
    end

    scenario 'a logged in user can create a comment' do
      visit '/posts'
      click_link 'Add a comment'
      fill_in 'Text', with: 'This is a comment' 
      click_button 'Add a comment'
      expect(page).to have_content 'This is a comment'
    end

     scenario 'a not logged in user cannot comment without signin in' do
       sign_out
       visit '/posts'
       click_link 'Add a comment'
       expect(page).not_to have_content 'Add a comment'
       expect(current_path).to eq '/users/sign_in'
     end
  end
end
