class AddUserToCodepens < ActiveRecord::Migration
  def change
    add_column :codepens, :user_id, :integer
    add_index :codepens, :user_id
  end
end
