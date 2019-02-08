FactoryBot.define do
  factory :tag do
    name { Faker::Bank.name }
  end
end
