class AddLessonToCodepens < ActiveRecord::Migration
  def change
    add_column :codepens, :lesson_id, :integer
    add_index :codepens, :lesson_id
  end
end
