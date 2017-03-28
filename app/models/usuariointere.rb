class Usuariointere < ActiveRecord::Base
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_interes, -> (id_interes) { where id_interes: id_interes}
end
