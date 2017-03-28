class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.integer :id_usuario
      t.string :username
      t.datetime :fecha_nacimiento
      t.string :telefono
      t.string :titulo
      t.string :ocupacion
      t.string :pais
      t.string :ciudad
      t.string :estado
      t.text :sobre_mi
      t.integer :id_imagen

      t.timestamps null: false
    end
  end
end
