FactoryBot.define do
  factory :comment do
    name { Faker::Beer.name }
    content { Faker::Lorem.paragraph }
    status { 1 }
    post
  end
end
