class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :user_type
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :telephone,  null: false

      t.timestamps
    end
  end
end
