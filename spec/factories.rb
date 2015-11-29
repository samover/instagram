FactoryGirl.define do
  factory :user do
    email 'pjackson@gmail.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    caption 'An example post'
    image { fixture_file_upload(Rails.root + 'spec/fixtures/files/first_upload.jpg', 'image/jpg') }
  end

  factory :comment do
    text 'This is a comment'
  end
end
