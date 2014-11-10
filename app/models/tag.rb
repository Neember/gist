class Tag < ActiveRecord::Base
  has_many :tagables
  has_many :snippets, through: :tagables, source: :snippet

  validates :title, presence: true
end