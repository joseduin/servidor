class AddIdInteresToCanals < ActiveRecord::Migration
  def change
    add_column :canals, :id_interes, :integer
  end
end
