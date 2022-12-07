FactoryBot.define do
  factory :car do
    name { 'MyString' }
    image { 'MyString' }
    brand { 'MyString' }
    duration { 100 }
    total_amount_payable { 100 }
    option_to_purchase_fee { 100 }
  end
end
