class Intere < ActiveRecord::Base
    scope :id, -> (id) { where id: id }
    scope :estatus, -> (estatus) { where estatus: estatus }
    scope :id_decanato, -> (id_decanato) { where id_decanato: id_decanato }
    scope :nombre, -> (search_term) { where("nombre LIKE ?", "%#{search_term}%") }
    scope :descripcion, -> (search_term) { where("descripcion LIKE ?", "%#{search_term}%") }
end
