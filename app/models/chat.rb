class Chat < ActiveRecord::Base
    scope :id, -> (id) { where id: id}
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_usuario2, -> (id_usuario2) { where id_usuario2: id_usuario2}
    scope :estatus, -> (estatus) { where estatus: estatus}
    scope :categoria, -> (categoria) { where categoria: categoria}
    scope :asunto, -> (search_term) { where("asunto LIKE ?", "%#{search_term}%") }
end
