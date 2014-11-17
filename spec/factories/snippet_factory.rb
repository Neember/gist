FactoryGirl.define do 
  factory :snippet do 
    sequence(:title) { |n| "Snippet #{n}" }
    content 'Lorem Ipsum Lorem Ipsum'
    association :user
  end
end