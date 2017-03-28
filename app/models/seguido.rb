class Seguido < ActiveRecord::Base
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_seguido, -> (id_seguido) { where id_seguido: id_seguido}
end
