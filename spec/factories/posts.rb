FactoryBot.define do
  factory :post do
    title { 'Title' }
    context { 'This is the context of this post' }
    category { 'Ruby' }
  end
end