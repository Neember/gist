FactoryGirl.define do 
  factory :snippet do 
    sequence(:title) { |n| "Snippet #{n}" }
    content 'This is the content of the Snippet'
  end
end