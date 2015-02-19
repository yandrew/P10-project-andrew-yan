class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :profile_pic
      t.string :full_name
      t.string :oauth_token
      t.string :ig_id
      
      t.timestamps
    end
  end
end


