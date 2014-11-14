class Snippet < ActiveRecord::Base
  attr_accessor :email

  belongs_to :user

  has_many :snippet_files, dependent: :destroy
  has_many :tagables, dependent: :destroy
  has_many :tags, through: :tagables, :source => :tag

  validates :title,   presence: true

  enum status: ['Personal', 'Share']

  def belongs_to?(user)
    return false unless user.present?
    user_id == user.id
  end
end
