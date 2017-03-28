class CreateDiscusiones < ActiveRecord::Migration
  def change
    create_table :discusiones do |t|
      t.integer :id_usuario
      t.integer :id_canal
      t.string :titulo
      t.string :contenido
      t.datetime :fecha
      t.integer :estatus

      t.timestamps null: false
    end
  end
end
