class CreateGameones < ActiveRecord::Migration
  def change
    create_table :gameones do |t|
      t.integer :user1
      t.integer :user2
      t.float :offer
      t.boolean :accept
      t.float :moneyontable

      t.timestamps
    end
  end
end
