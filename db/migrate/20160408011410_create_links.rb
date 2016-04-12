class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :slug
      t.string :destination
      t.integer :count

      t.timestamps null: false
    end
  end
end
