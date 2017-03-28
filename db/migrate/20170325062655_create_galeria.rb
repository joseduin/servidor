class CreateGaleria < ActiveRecord::Migration
  def change
    create_table :galeria do |t|
      t.integer :id_usuario
      t.integer :id_imagen

      t.timestamps null: false
    end
  end
end
