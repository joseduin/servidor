class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :id_usuario
      t.integer :id_usuario2
      t.text :asunto
      t.text :contenido
      t.integer :estatus
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
