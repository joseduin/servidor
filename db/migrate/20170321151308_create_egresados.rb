class CreateEgresados < ActiveRecord::Migration
  def change
    create_table :egresados do |t|
      t.string :nacionalidad
      t.integer :cedula
      t.string :nombre
      t.string :apellido
      t.string :email
      t.datetime :fecha_egreso
      t.string :carrera
      t.string :decanato

      t.timestamps null: false
    end
  end
end
