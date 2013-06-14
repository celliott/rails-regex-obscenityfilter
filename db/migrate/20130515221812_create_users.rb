class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name", :limit => 25
      t.string "password", :limit => 64
      t.string "hint", :limit => 25
      t.integer "character_id"
      t.timestamps
    end
  end
end
