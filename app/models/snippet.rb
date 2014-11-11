class Snippet < ActiveRecord::Base
  belongs_to :user

  has_many :tagables
  has_many :tags, through: :tagables, source: :tag

  validates :title,   presence: true
  validates :content, presence: true

  enum status: [ 'Personal', 'Share' ]
end