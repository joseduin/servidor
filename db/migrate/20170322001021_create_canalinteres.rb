class CreateCanalinteres < ActiveRecord::Migration
  def change
    create_table :canalinteres do |t|
      t.integer :id_canal
      t.integer :id_interes

      t.timestamps null: false
    end
  end
end
