FactoryBot.define do
  factory :invoice do
    user

    number { FFaker::Number.number(digits: 6) }
    issuer { FFaker::NameBR.name }
    payer { FFaker::NameBR.name }
    price { FFaker::Number.decimal }
    due_date { 10.days.from_now.to_date }
  end
end
