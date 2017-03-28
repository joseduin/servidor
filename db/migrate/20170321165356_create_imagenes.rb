class CreateImagenes < ActiveRecord::Migration
  def change
    create_table :imagenes do |t|
      t.string :nombre
      t.binary :data
      t.string :filename
      t.string :tipo

      t.timestamps null: false
    end
  end
end
