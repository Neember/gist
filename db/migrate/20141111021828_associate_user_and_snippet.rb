class AssociateUserAndSnippet < ActiveRecord::Migration
  def change
    change_table :snippets do |t|
      t.references :user, index: true 
    end
  end
end
