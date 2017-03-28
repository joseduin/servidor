class Imagene < ActiveRecord::Base
    scope :id, -> (id) { where id: id}
    scope :filename, -> (filename) { where filename: filename}
    scope :tipo, -> (tipo) { where tipo: tipo}
    scope :nombre, -> (search_term) { where("nombre LIKE ?", "%#{search_term}%") }
end
