class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :tipo
      t.integer :id_usuario
      t.integer :id_canal
      t.string :titulo
      t.text :contenido
      t.datetime :fecha
      t.integer :estatus

      t.timestamps null: false
    end
  end
end
