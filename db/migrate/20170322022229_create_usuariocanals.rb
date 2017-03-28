class CreateUsuariocanals < ActiveRecord::Migration
  def change
    create_table :usuariocanals do |t|
      t.integer :id_usuario
      t.integer :id_canal

      t.timestamps null: false
    end
  end
end
