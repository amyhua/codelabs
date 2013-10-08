class AddAdminFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :carrier, :string
    add_column :users, :receive_sms, :boolean
    add_column :users, :receive_email, :boolean
  end
end
