FactoryBot.define do
  factory :post do
    title { 'Title' }
    context { 'This is the context of this post' }
    status { 1 }
    image { 'image_string' }
    user { build(:user) }
    score { 1 }
    
    association :category, factory: :category, name: 'Ruby'
  end
end
