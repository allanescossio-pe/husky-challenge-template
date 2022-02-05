FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.unique.email }

    trait :with_token do
      token { FFaker::Lorem.unique.characters(characters_count = 50) }
    end
  end
end
