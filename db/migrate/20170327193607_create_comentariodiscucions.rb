class CreateComentariodiscucions < ActiveRecord::Migration
  def change
    create_table :comentariodiscucions do |t|
      t.integer :id_post
      t.integer :id_usuario
      t.string :contenido
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
