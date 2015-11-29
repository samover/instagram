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

      scenario 'a post shows how long ago it was created' do
        photo = fixture_file_upload('files/first_upload.jpg', 'image/jpg')
        post = Post.new(caption: 'My first upload', image: photo)
        post.user_id = User.all.last.id 
        post.created_at = DateTime.now - 20.minutes
        post.save
        visit '/'
        expect(page).to have_content '20 minutes ago' 
      end

      scenario 'a post shows the username of the creator' do
        expect(page).to have_content 'psmith'
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

    context 'when user is not logged in' do
      scenario 'prompt to log in' do
        visit '/posts'
        click_link 'Add photo'
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  context 'deleting a post' do
    before do
      sign_up
      post_photo
    end

    context 'when a user is logged in' do
      it 'can delete his own post' do
        visit '/posts'
        click_link 'Delete post'
        expect(page).not_to have_content 'An example of photo upload'
        expect(page).to have_content 'Post deleted succesfully'
      end
      it 'cannot delete someone else post' do
        sign_out
        sign_up(email: 'sam@makers.com', password: 'password')
        expect(page).not_to have_content 'Delete post'
      end
    end

    context 'when a user is not logged in' do
      it 'cannot delete a post' do
        sign_out
        expect(page).not_to have_content 'Delete post'
      end
    end
  end
end
