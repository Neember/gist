FactoryGirl.define do 
  factory :user do 
    sequence(:name)     { |n| "User #{n}" }
    sequence(:username) { |n| "Username #{n}" }
    password            '123123123'
    email { "#{username.parameterize.underscore}@example.com" }
  end
end