require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = FactoryBot.build(:user, posts_counter: -1)
    expect(user).not_to be_valid
  end

  it 'is valid with a positive posts_counter' do
    user = FactoryBot.build(:user, posts_counter: 1)
    expect(user).to be_valid
  end

  # Method tests
  describe '#most_recent_posts' do
    let(:user) { FactoryBot.create(:user) }
    before do
      FactoryBot.create_list(:post, 5, user:, created_at: 5.days.ago)
      @recent_posts = FactoryBot.create_list(:post, 3, user:)
    end

    it 'returns the most recent posts' do
      expect(user.most_recent_posts).to match_array(@recent_posts)
    end
  end
end
