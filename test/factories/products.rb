FactoryBot.define do
  factory :product do
    title { Faker::Food.ingredient }
    image { Faker::Avatar.image }
  end
end