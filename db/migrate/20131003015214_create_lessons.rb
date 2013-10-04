class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.date :date
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
