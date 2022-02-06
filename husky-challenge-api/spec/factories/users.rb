FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.unique.email }
  end
end
