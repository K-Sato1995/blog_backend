FactoryBot.define do
  factory :comment do
    title { Faker::Beer.name }
    content { Faker::Lorem.paragraph }
    status { 1 }
  end
end
