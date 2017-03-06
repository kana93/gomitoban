class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :name
      t.string :chatworkid
      t.boolean :superuser

      t.timestamps
    end
  end
end
