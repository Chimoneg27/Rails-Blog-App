require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author_id: @user.id)
    @comments = FactoryBot.create_list(:comment, 3, post_id: @post.id)
    visit user_posts_path(@user)
  end
  it 'shows the post\'s title' do
    expect(page).to have_content(@post.title)
  end
  it 'shows who wrote the post' do
    expect(page).to have_content(@user.name)
  end
  it 'shows how many comments it has' do
    expect(page).to have_content("Comments: #{@comments_counter}")
  end
  it 'shows how many likes it has' do
    expect(page).to have_content("Likes: #{@likes_counter}")
  end
  it 'shows the post body' do
    expect(page).to have_content(@post.text)
  end
  it 'displays all comments authors' do
    @comments.each do |comment|
      username = User.find(comment.user_id).name
      expect(page).to have_content(username)
    end
  end
  it 'displays all comments' do
    @comments.each do |comment|
      expect(page).to have_content(comment.Text)
    end
  end
end
