FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@email.com" }
    password { 'secret' }
    first_name { 'Jean-Luc' }
    last_name { 'Picard' }
  end
end
