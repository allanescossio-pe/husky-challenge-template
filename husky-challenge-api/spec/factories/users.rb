FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.unique.email }
    auth_token_has_been_validated { false }
  end
end
