class RenameMyGistsToSnippets < ActiveRecord::Migration
  def up
    rename_table :my_gists, :snippets
  end
  def down
    rename_table :snippets, :my_gists
  end
end
