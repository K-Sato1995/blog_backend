FactoryBot.define do
  factory :post do
    title { Faker::Beer.name }
    context { Faker::Lorem.paragraph }
    status { 1 }
    image { 'https://images.pexels.com/photos/954202/pexels-photo-954202.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940' }
    user { build(:user) }
    score { 1 }

    association :category, factory: :category

    after(:create) do |post|
      post.tags << FactoryBot.create(:tag)
    end
  end
end
