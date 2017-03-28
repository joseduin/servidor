class Canalintere < ActiveRecord::Base
    scope :id_canal, -> (id_canal) { where id_canal: id_canal}
    scope :id_interes, -> (id_interes) { where id_interes: id_interes}
end
