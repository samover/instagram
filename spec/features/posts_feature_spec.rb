require 'rails_helper'

feature 'photo-posts' do
  context 'no photos have been posted' do
    scenario 'should prompt a user to upload an photo' do
      visit '/posts'
      expect(page).to have_link 'Add photo'
      expect(page).to have_content 'No photos posted yet'
    end
  end
end
