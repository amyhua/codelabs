class CreateCodepens < ActiveRecord::Migration
  def change
    create_table :codepens do |t|
      t.string :url
      t.string :title
      t.text :note

      t.timestamps
    end
  end
end
