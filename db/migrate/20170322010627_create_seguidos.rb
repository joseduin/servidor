class CreateSeguidos < ActiveRecord::Migration
  def change
    create_table :seguidos do |t|
      t.integer :id_usuario
      t.integer :id_seguido

      t.timestamps null: false
    end
  end
end
