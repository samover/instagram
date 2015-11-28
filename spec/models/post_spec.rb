require 'rails_helper'

describe Post, type: :model do
  context '#create' do
    before do
      @photo = fixture_file_upload('files/first_upload.jpg', 'image/jpg')
      @invalid_upload = fixture_file_upload('files/file.txt', 'text/plain')
    end

    it 'creates a new post' do
      Post.create(caption: 'My first upload', image: @photo)
      expect(Post.all.count).to eq 1
    end

    it 'does not allow a post without a photo' do
      post = Post.new(caption: 'An invalid post')
      expect(post).to have(1).error_on :image
      expect(post).not_to be_valid
    end

    it 'does not allow a post with an invalid image' do
      post = Post.new(caption: 'Post with invalid image format', image: @invalid_upload)
      expect(post).to have(1).error_on :image
      expect(post).not_to be_valid
    end
  end
end
