class RemoveTypeFieldOfSnippetFile < ActiveRecord::Migration
  def change
      remove_column :snippet_files, :type
  end
end
