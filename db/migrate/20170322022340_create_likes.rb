class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :id_post
      t.integer :id_usuario
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
