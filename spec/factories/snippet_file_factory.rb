FactoryGirl.define do 
  factory :snippet_file do 
    sequence(:name) { |n| "File #{n}" }
    type 'text/plain'
    language 'Markdown'
    association :snippet
  end
end