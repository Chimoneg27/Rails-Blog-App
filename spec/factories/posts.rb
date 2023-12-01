FactoryBot.define do
  factory :post do
    title { 'The Life of Pablo' }
    text { 'No more parties in LA' }
    comments_counter { 0 }
    likes_counter { 0 }
    author_id { association(:user).id }
  end
end
