FactoryBot.define do
  factory :comment do
    Text { 'Revolution' }
    association :user, factory: :user
    association :post, factory: :post
  end
end
