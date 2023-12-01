FactoryBot.define do
  factory :user do
    name { 'Garvin Chimone' }
    photo { 'example.jpg' }
    bio { 'Discipline beats motivation every time' }
    posts_counter { 0 }
  end
end
