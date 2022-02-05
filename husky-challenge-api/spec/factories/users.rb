FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.unique.email }

    trait :with_token do
      auth_token { FFaker::Lorem.unique.characters(characters_count = 24) }
    end
  end
end
