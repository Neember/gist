class Tagable < ActiveRecord::Base
  belongs_to :snippet
  belongs_to :tag 

  validates :snippet, presence: true
  validates :tag    , presence: true
end