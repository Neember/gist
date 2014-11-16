FactoryGirl.define do 
  factory :snippet_file do 
    sequence(:name) { |n| "File #{n}" }
    content 'This is the content of the file'
    language 'Markdown'
    association :snippet
  end
end