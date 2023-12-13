require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  # User index page:

  # I can see the username of all other users.
  # I can see the profile picture for each user.
  # I can see the number of posts each user has written.
  # When I click on a user, I am redirected to that user's show page.

  # User show page:
  before(:each) do
    @users = FactoryBot.create_list(:user, 1)
    visit users_path
  end

  it 'shows the username of all other users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'shows the profile picture for each user' do
    @users.each do |_user|
      expect(page).to have_css("img[src*='example']")
    end
  end

  it 'shows the number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content("Number of Posts: #{user.posts_counter}")
    end
  end

  it 'redirects to the user show page when a user is clicked' do
    @users.each do |user|
      visit users_path
      find("#user_#{user.id}").click
      expect(page).to have_current_path(user_path(user))
    end
  end
end
