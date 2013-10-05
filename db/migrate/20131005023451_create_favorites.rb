class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :codepen_id

      t.timestamps
    end
    add_index :favorites, :codepen_id
    add_index :favorites, :user_id
  end
end
