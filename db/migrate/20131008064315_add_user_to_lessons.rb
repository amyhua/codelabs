class AddUserToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :user_id, :integer
    add_column :lessons, :status, :string

  end
end
