require 'rails_helper'

describe Post, type: :model do
  context '#create' do
    before do
      @photo = fixture_file_upload('files/first_upload.jpg', 'image/jpg')
    end

    it 'creates a new post' do
      Post.create(caption: 'My first upload', image: @photo)
      expect(Post.all.count).to eq 1
    end
  end
end
