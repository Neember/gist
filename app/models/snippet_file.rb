class SnippetFile < ActiveRecord::Base
  belongs_to :snippet

  validates :name,       presence: true
  validates :content,    presence: true
  validates :snippet_id, presence: true
end