class IndexCategoryOnLinks < ActiveRecord::Migration
  def change
    add_index :links, :category_id
  end

end
