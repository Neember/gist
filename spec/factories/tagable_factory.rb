FactoryGirl.define do 
  factory :tagable do 
    association :snippet
    association :tag
  end
end