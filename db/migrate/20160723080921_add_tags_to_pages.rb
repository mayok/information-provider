class AddTagsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :tags, :string
  end
end
