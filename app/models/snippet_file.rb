class SnippetFile < ActiveRecord::Base
  belongs_to :snippet

  validates :name,       presence: true
  validates :content,    presence: true
end