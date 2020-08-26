class AddUserStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_status, :string
  end
end
