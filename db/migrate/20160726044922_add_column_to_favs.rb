class AddColumnToFavs < ActiveRecord::Migration
  def change
    add_column :favs, :web, :integer
    add_column :favs, :mobile, :integer
    add_column :favs, :os, :integer
    add_column :favs, :editor, :integer
    add_column :favs, :lang, :integer
    add_column :favs, :services, :integer
  end
end
