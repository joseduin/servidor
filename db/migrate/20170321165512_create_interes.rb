class CreateInteres < ActiveRecord::Migration
  def change
    create_table :interes do |t|
      t.integer :id_decanato
      t.string :nombre
      t.string :descripcion
      t.integer :estatus

      t.timestamps null: false
    end
  end
end
