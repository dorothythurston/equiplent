class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :telephone

      t.timestamps
    end
  end
end
