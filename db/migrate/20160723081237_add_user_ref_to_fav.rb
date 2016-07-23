class AddUserRefToFav < ActiveRecord::Migration
  def change
    add_reference :favs, :user, index: true, foreign_key: true
  end
end
