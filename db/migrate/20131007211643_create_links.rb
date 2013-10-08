class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.string :image
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
