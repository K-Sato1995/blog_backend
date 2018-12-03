FactoryBot.define do
  factory :post do
    title { 'Title' }
    intro { 'This is the intro of this post' }
    context { 'This is the context of this post' }
    status { 1 }
    image { 'image_string' }

    association :category, factory: :category, name: 'Ruby'
  end
end
