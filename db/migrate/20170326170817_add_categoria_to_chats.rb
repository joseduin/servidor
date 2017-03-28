class AddCategoriaToChats < ActiveRecord::Migration
  def change
    add_column :chats, :categoria, :integer
  end
end
