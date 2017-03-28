class Role < ActiveRecord::Base
    scope :nombre, -> (search_term) { where("nombre LIKE ?", "%#{search_term}%") }
end
