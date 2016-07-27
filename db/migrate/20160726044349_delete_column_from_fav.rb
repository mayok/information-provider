class DeleteColumnFromFav < ActiveRecord::Migration
  def change
    remove_column :favs, :html
    remove_column :favs, :javascript
    remove_column :favs, :css
  end
end
