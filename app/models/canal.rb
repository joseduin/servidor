class Canal < ActiveRecord::Base
    scope :id, -> (id) { where id: id}
    scope :id_interes, -> (id_interes) { where id_interes: id_interes}
    scope :id_creador, -> (id_creador) { where id_creador: id_creador}
    scope :id_decanato, -> (id_decanato) { where nacionalidad: id_decanato}
    scope :nombre, -> (search_term) { where("nombre LIKE ?", "%#{search_term}%") }
end
