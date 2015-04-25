class CreateUsers < ActiveRecord::Migration
  def change
    #t variable is passed to block and t is used as variablebun
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
