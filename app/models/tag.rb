class Tag < ActiveRecord::Base
  include RailsAdmin::Tag

  has_many :tagables
  has_many :snippets, through: :tagables, source: :snippet

  validates :title, presence: true
end