class Perfil < ActiveRecord::Base
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :username, -> (search_term) { where("username LIKE ?", "%#{search_term}%") }
end
