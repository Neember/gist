class RemoveGithubIdFromSnippet < ActiveRecord::Migration
  def change
    remove_column :snippets, :code, :string
  end
end
