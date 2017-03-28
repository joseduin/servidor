class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.references :role, index: true, foreign_key: true
      t.string :username
      t.string :pass
      t.string :email
      t.integer :estatus
      t.string :cedula
      t.string :nacionalidad

      t.timestamps null: false
    end
  end
end
