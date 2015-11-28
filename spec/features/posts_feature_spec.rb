require 'rails_helper'

feature 'features for posting photos' do

  context 'viewing posts' do
    context 'no photos have been posted' do
      scenario 'should prompt a user to upload an photo' do
        visit '/posts'
        expect(page).to have_link 'Add photo'
        expect(page).to have_content 'No photos posted yet'
      end
    end

    context 'photos have been posted' do
      before do
        sign_up
        post_photo
      end

      scenario 'a user who is logged in can see all posts' do
        visit '/'
        expect(page).to have_content 'An example of photo upload'
        expect(page).to have_xpath("//img[contains(@src, 'first_upload.jpg')]")
      end

      scenario 'a user who is not logged in can see all posts' do
        sign_out
        visit '/'
        expect(page).to have_content 'An example of photo upload'
        expect(page).to have_xpath("//img[contains(@src, 'first_upload.jpg')]")
      end
    end
  end

  context 'creating posts' do

    context 'when user is logged in' do
      before do
        sign_up
        visit '/posts'
        click_link 'Add photo'
      end

      scenario 'prompt a user to fill in a form, then display the posts' do
        visit '/posts'
        click_link 'Add photo'
        page.attach_file 'post_image', Rails.root + 'spec/fixtures/files/first_upload.jpg'
        fill_in 'Caption', with: 'An example of photo upload'
        click_button 'Add photo'
        expect(page).to have_content 'An example of photo upload'
        expect(page).to have_xpath("//img[contains(@src, 'first_upload.jpg')]")
      end

      scenario 'a user cannot create a post without uploading an image' do
        visit '/posts'
        click_link 'Add photo'
        fill_in 'Caption', with: 'An example without a photo upload'
        click_button 'Add photo'
        expect(page).not_to have_content 'An example without a photo upload'
        expect(page).to have_content 'error'
      end

      scenario 'a user cannot create a post without a caption' do
        page.attach_file 'post_image', Rails.root + 'spec/fixtures/files/first_upload.jpg'
        click_button 'Add photo'
        expect(page).to have_content 'error'
        expect(page).not_to have_xpath("//img[contains(@src, 'first_upload.jpg')]")
      end

      scenario 'a user cannot create a post without a caption' do
        page.attach_file 'post_image', Rails.root + 'spec/fixtures/files/first_upload.jpg'
        fill_in 'Caption', with: 'Ab'
        click_button 'Add photo'
        expect(page).to have_content 'error'
        expect(page).not_to have_content 'Ab'
      end
    end
  end

  context 'when user is not logged in' do
    scenario 'prompt to log in' do
      visit '/posts'
      click_link 'Add photo'
      expect(current_path).to eq '/users/sign_in'
    end
  end
end
