FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { Faker::Internet.email }
    password { 'password' }
    role { 'admin' }
  end
end
