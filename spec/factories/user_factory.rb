FactoryGirl.define do
  factory :user do
    provider  'github'
    uid       '9523491'
    name      nil
    nickname  'Johnytran'
    email     'tuananhasp@gmail.com'
    avatar    'https://avatars.githubusercontent.com/u/9523491?v=2'
  end
end
