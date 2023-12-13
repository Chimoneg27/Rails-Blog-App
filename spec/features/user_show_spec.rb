require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  include Rails.application.routes.url_helpers
  # user show page:

  # I can see the user's profile picture.
  # I can see the user's username.
  # I can see the number of posts the user has written.
  # I can see the user's bio.
  # I can see the user's first 3 posts.
  # I can see a button that lets me view all of a user's posts.
  # When I click a user's post, it redirects me to that post's show page.
  # When I click to see all posts, it redirects me to the user's post's index page.

  before(:each) do
    @user = FactoryBot.create(:user)
    @posts = FactoryBot.create_list(:post, 3, author_id: @user.id)
    visit user_path(@user)
  end

  it 'shows the user\'s profile picture' do
    expect(page).to have_css("img[src*='example']")
  end

  it 'shows the user\'s username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content("Number of Posts: #{@posts_counter}")
  end

  it 'shows the user\'s bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows the user\'s first 3 posts' do
    post = @posts.first
    expect(page).to have_content(post.title)
  end

  it 'shows a button that lets me view all of a user\'s posts' do
    expect(page).to have_link('More Posts')
  end

  it 'redirects me to that post\'s show page when I click a user\'s post' do
    post = @posts.sort_by(&:created_at).last # rubocop:disable Style/RedundantSort
    visit user_path(@user)
    expect(page).to have_content(post.title)
    click_link(post.title, match: :first)
    expect(page).to have_current_path("/users/#{post.author_id}/posts/#{post.id}")
  end

  it 'redirects me to the user\'s post\'s index page when I click to see all posts' do
    click_link('More Posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
