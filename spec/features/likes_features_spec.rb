require 'rails_helper'

describe 'features for liking a post' do
  before do
    user = create(:user)
    create(:post, user_id: user.id )
  end
  
  context 'liking posts' do
    scenario 'there is a link to like a post' do
      visit '/posts'
      within('div.likes') do
        expect(page).to have_link 'Like'
      end
    end

    scenario 'a user can like a post' do
      sign_up
      visit '/posts'
      click_link 'Like'
      within('div.likes') do
        expect(page).to have_content '1 like'
      end
    end
  end
end
