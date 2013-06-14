class CreatePasswordHints < ActiveRecord::Migration
  def change
    create_table :password_hints do |t|
      t.string "hint", :limit => 75
      t.timestamps
    end
  end
end
