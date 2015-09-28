class RemoveUserEmailFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user_email, :string
  end
end
