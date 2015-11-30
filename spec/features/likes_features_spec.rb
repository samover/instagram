require 'rails_helper'

describe 'features for liking a post' do
  before do
    user = create(:user)
    create(:post, user_id: user.id )
    sign_up
    visit '/posts'
  end
  
  context 'liking posts' do
    scenario 'there is a link to like a post' do
      within('div.likes') do
        expect(page).to have_xpath("//img[contains(@title, 'Like')]")
      end
    end

    scenario 'a user can like a post' do
      find(:xpath, "//a/img[@alt='Unliked']/..").click
      within('div.likes') do
        expect(page).to have_content '1 like'
      end
    end

    scenario 'a user can not like a post twice, but can unlike' do
      find(:xpath, "//a/img[@alt='Unliked']/..").click
      within('div.likes') do
        expect(page).not_to have_xpath("//img[contains(@title, 'Like')]")
        expect(page).to have_xpath("//img[contains(@title, 'Unlike')]")
      end
    end

    scenario 'a user can unlike a post' do
      find(:xpath, "//a/img[@alt='Unliked']/..").click
      within('div.likes') do
        expect(page).to have_content '1 like'
      end
      find(:xpath, "//a/img[@alt='Liked']/..").click
      within('div.likes') do
      expect(page).to have_content '0 likes'
      end
    end
  end
end
