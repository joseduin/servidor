class CreateDecanatos < ActiveRecord::Migration
  def change
    create_table :decanatos do |t|
      t.string :iniciales
      t.string :nombre

      t.timestamps null: false
    end
  end
end
