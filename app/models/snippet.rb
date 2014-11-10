class Snippet < ActiveRecord::Base
  has_many :tagables
  has_many :tags, through: :tagables, source: :tag

  validates :title,   presence: true
  validates :content, presence: true

  enum status: [ :personal, :share ]
end