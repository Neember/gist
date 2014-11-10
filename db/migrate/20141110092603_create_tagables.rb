class CreateTagables < ActiveRecord::Migration
  def change
    create_table :tagables do |t|
      t.references :snippet, index: true
      t.references :tag, index: true
      t.timestamps
    end
  end
end
