require 'rails_helper'

feature 'photo-posts' do
  context 'no photos have been posted' do
    scenario 'should prompt a user to upload an photo' do
      visit '/posts'
      expect(page).to have_link 'Add photo'
      expect(page).to have_content 'No photos posted yet'
    end
  end

  context 'a post has been added' do
    before { Post.create(caption: 'My first post') }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'My first post'
      expect(page).not_to have_content 'No photos posted yet'
    end
  end
end
