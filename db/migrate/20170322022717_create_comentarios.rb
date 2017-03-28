class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :id_post
      t.integer :id_usuario
      t.text :contenido
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
