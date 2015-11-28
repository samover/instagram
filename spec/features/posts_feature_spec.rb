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

  context 'creating posts' do
    scenario 'prompt a user to fill in a form, then display the posts' do
      visit '/posts'
      click_link 'Add photo'
      page.attach_file 'post_image', Rails.root + 'spec/fixtures/files/first_upload.jpg'
      fill_in 'Caption', with: 'An example of photo upload'
      click_button 'Add photo'
      expect(page).to have_content 'An example of photo upload'
      expect(page).to have_xpath("//img[contains(@src, 'first_upload.jpg')]")
    end
  end
end
