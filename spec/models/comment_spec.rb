require 'rails_helper'

describe Comment do
  it { is_expected.to belong_to :post }
  it { is_expected.to belong_to :user }


    it 'does not allow to save a post without text' do
      comment = Comment.new
      expect(comment).to have(1).error_on :text
      expect(comment).not_to be_valid
    end

    it 'does not allow to save a post with less than three letters' do
      comment = Comment.new(text: 'ab')
      expect(comment).to have(1).error_on :text
      expect(comment).not_to be_valid
    end
end
