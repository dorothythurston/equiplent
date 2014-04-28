class RemoveUserTypeFromUserProfile < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :user_type, :string
  end
end
