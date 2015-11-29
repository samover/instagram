require 'rails_helper'

describe 'features for commenting on posts' do

  context 'creating comments' do
    before do
      sign_up
      post_photo 
    end

    scenario 'a logged in user can create a comment' do
      post_comment
      expect(page).to have_content 'This is a comment'
    end

     scenario 'a not logged in user cannot comment without signin in' do
       sign_out
       visit '/posts'
       click_link 'Add a comment'
       expect(page).not_to have_link 'Add a comment'
       expect(current_path).to eq '/users/sign_in'
     end
  end

  context 'deleting comments' do
    before do
      sign_up
      post_photo
      post_comment
      visit '/posts'
    end

    scenario 'a user can delete her own comment' do
      click_link 'Delete comment'
      expect(current_path).to eq '/posts'
      expect(page).not_to have_content 'This is a comment'
    end

    scenario 'a user who does not own the comment cannot delete it' do
      sign_out
      sign_up(email: 'sam@makers.com')
      visit '/posts'
      expect(page).not_to have_link 'Delete comment'
    end

    scenario 'a user who is not logged in cannot delete a comment' do
      sign_out
      visit '/posts'
      expect(page).not_to have_link 'Delete comment'
    end
  end
end
