class CreateFiles < ActiveRecord::Migration
  def change
    remove_column :snippets, :content

    create_table :snippet_files do |t|
      t.string :name
      t.text   :content
      t.string :type
      t.string :language 
      t.references :snippet, index: true
      t.timestamps
    end
  end
end
