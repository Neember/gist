class Snippet < ActiveRecord::Base
  
  validates :title,   presence: true
  validates :content, presence: true

  enum status: [ :personal, :share ]
end