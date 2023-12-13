require 'rails_helper'
RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @posts = FactoryBot.create_list(:post, 3, author_id: @user.id)
    @posts.each do |post|
      FactoryBot.create_list(:comment, 3, post:, Text: 'Revolution', user_id: @user.id, created_at: 4.days.ago)
    end
    visit user_posts_path(@user)
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
  it 'shows a post\'s title' do
    post = @posts.first
    expect(page).to have_content(post.title)
  end
  it 'shows some of the post\'s body' do
    post = @posts.first
    expect(page).to have_content(post.text)
  end
  it 'shows the first comments on a post' do
    post = @posts.first
    expect(page).to have_content(post.comments.first.Text)
  end
  it 'shows how many comments a post has' do
    post = @posts.first
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end
  it 'shows how many likes a post has' do
    post = @posts.first
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end
  it 'shows a section for pagination if there are more posts than fit on the view' do
    FactoryBot.create_list(:post, 10, author_id: @user.id)
    visit user_posts_path(@user)
    expect(page).to have_content('Pagination')
  end
  it 'redirects me to that post\'s show page when I click a post' do
    post = @posts.first
    visit user_posts_path(@user)
    expect(page).to have_content(post.title)
    click_link(post.title, match: :first)
    expect(page).to have_current_path(user_post_path(@user, post))
  end
end
