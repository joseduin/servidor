class Decanato < ActiveRecord::Base
    scope :iniciales, -> (search_term) { where("iniciales LIKE ?", "%#{search_term}%") }
    scope :nombre, -> (search_term) { where("nombre LIKE ?", "%#{search_term}%") }
end
