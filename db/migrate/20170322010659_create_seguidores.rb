class CreateSeguidores < ActiveRecord::Migration
  def change
    create_table :seguidores do |t|
      t.integer :id_usuario
      t.integer :id_seguidor

      t.timestamps null: false
    end
  end
end
