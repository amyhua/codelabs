class IndexUserOnLessons < ActiveRecord::Migration
  def change
    add_index :lessons, :user_id
    add_index :lessons, :status
  end
end
