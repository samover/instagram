require 'rails_helper'

describe 'features for commenting on posts' do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, post_id: post.id)}

  context 'viewing comments' do
    before { Comment.create(text: 'This is a comment')}
    scenario 'any user can see comments on a post' do
      visit '/posts'
      expect(page).to have_content 'This is a comment'
    end
  end

  context 'creating comments' do
  end
end
