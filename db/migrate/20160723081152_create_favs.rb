class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.integer :html
      t.integer :javascript
      t.integer :css

      t.timestamps null: false
    end
  end
end
