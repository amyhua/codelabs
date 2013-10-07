class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :detail
      t.integer :user_id
      t.timestamps
    end
  end
end
