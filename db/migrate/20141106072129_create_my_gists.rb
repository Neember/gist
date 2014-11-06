class CreateMyGists < ActiveRecord::Migration
  def change
    create_table :my_gists do |t|
      t.string  :title
      t.text    :content
      t.integer :status
      t.timestamps
    end
  end
end
