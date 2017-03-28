class Galeria < ActiveRecord::Base
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_imagen, -> (id_imagen) { where id_imagen: id_imagen}
    scope :id, -> (id) { where id: id }
end
