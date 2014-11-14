FactoryGirl.define do 
  factory :snippet do 
    sequence(:title) { |n| "Snippet #{n}" }
    association :user
  end
end