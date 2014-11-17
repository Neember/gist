class Snippet < ActiveRecord::Base
  include RailsAdmin::Snippet
  attr_accessor :email

  belongs_to :user

  has_many :tagables, dependent: :destroy
  has_many :tags, through: :tagables, :source => :tag

  validates :title,   presence: true

  accepts_nested_attributes_for :snippet_files

  enum status: ['Personal', 'Share']

  def belongs_to?(user)
    return false unless user.present?
    user_id == user.id
  end
end
