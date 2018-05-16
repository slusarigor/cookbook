FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    description { Faker::Food.description }
    image { Faker::Avatar.image }

    transient do
      titles([])
    end

    trait :with_products do
      after :create do |recipe, options|
        options.titles.each do |title|
          recipe.products << create(:product, title: title)
        end
      end
    end
  end
end
