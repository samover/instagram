require 'rails_helper'

describe 'features for liking a post' do
  before do
    user = create(:user)
    create(:post, user_id: user.id )
    sign_up
    visit '/posts'
  end
  
  context 'liking posts' do
    it 'has a link to like a post' do
      within('div.likes') do
        expect(page).to have_link 'Like'
      end
    end

    it 'can like it once and increases the likes by one', js: true do
      click_link 'Like'
      within('div.likes') do
        expect(page).to have_content '1 like'
      end
    end

    it 'cannot like it more than once', js: true do
      click_link 'Like'
      within('div.likes') do
        expect(page).not_to have_link 'Like'
        expect(page).to have_link 'Unlike'
      end
    end
  end

  context 'unliking a post', js: true do
    it 'decreases the count of likes by one' do
      click_link 'Like'
      within('div.likes') do
        expect(page).to have_content '1 like'
      end
      click_link 'Unlike'
      within('div.likes') do
        expect(page).to have_content '0 likes'
      end
    end
  end
end
