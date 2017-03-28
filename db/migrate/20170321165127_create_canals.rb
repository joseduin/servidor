class CreateCanals < ActiveRecord::Migration
  def change
    create_table :canals do |t|
      t.integer :id_creador
      t.integer :id_decanato
      t.integer :id_imagen
      t.string :nombre
      t.text :descripcion
      t.integer :estatus

      t.timestamps null: false
    end
  end
end
