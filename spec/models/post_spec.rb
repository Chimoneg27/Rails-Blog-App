require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is not valid without a title' do
    post = FactoryBot.build(:post, title: nil, author_id: user.id)
    expect(post).not_to be_valid
  end

  it 'is valid with a title and other attributes' do
    post = FactoryBot.build(:post, author_id: user.id)
    expect(post).to be_valid
  end

  it 'is not valid with more than 250 characters' do
    post = FactoryBot.build(:post, title: 'a' * 251, author_id: user.id)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post = FactoryBot.build(:post, comments_counter: -1, author_id: user.id)
    expect(post).not_to be_valid
  end

  it 'returns the 5 most recent posts' do
    post = FactoryBot.create(:post, author_id: user.id)
    FactoryBot.create_list(:comment, 3, post:, created_at: 4.days.ago)
    recent_comments = FactoryBot.create_list(:comment, 5, post:)

    expect(post.most_recent_comments).to eq(recent_comments.reverse)
  end

  it 'updates author\'s posts_counter after save' do
    expect(user.posts_counter).to eq(0)

    FactoryBot.create(:post, author_id: user.id)
    user.reload

    expect(user.posts_counter).to eq(1)
  end
end
