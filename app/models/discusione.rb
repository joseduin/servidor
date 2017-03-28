class Discusione < ActiveRecord::Base
    scope :id, -> (id) { where id: id}
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_canal, -> (id_canal) { where id_canal: id_canal }
    scope :titulo, -> (search_term) { where("titulo LIKE ?", "%#{search_term}%") }
end
