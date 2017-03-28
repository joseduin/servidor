class Seguidore < ActiveRecord::Base
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_seguidor, -> (id_seguidor) { where id_seguidor: id_seguidor}
end
