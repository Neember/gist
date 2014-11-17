class RemoveSnippelFileTable < ActiveRecord::Migration
  def up
    drop_table :snippet_files
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
