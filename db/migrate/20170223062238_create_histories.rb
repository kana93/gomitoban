class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :tobanid
      t.date :gomidasibi

      t.timestamps
    end
  end
end
