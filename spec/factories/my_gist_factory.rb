FactoryGirl.define do 
  factory :my_gist do 
    sequence(:title) { |n| "Gist #{n}" }
    content 'This is the content of the Gist'
  end
end