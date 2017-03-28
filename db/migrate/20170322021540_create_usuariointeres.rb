class CreateUsuariointeres < ActiveRecord::Migration
  def change
    create_table :usuariointeres do |t|
      t.integer :id_usuario
      t.integer :id_interes

      t.timestamps null: false
    end
  end
end
