def sign_up(email: 'psmith@makers.com', password: 'password')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email 
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_out
  click_link 'Sign out'
end

def post_photo
  visit '/posts'
  click_link 'Add photo'
  page.attach_file 'post_image', Rails.root + 'spec/fixtures/files/first_upload.jpg'
  fill_in 'Caption', with: 'An example of photo upload'
  click_button 'Add photo'
end

def post_comment
  visit '/posts'
  click_link 'Add a comment'
  fill_in 'Text', with: 'This is a comment' 
  click_button 'Add a comment'
end
