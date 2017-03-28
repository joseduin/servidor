class Egresado < ActiveRecord::Base
    scope :cedula, -> (cedula) { where cedula: cedula}
    scope :nacionalidad, -> (nacionalidad) { where nacionalidad: nacionalidad}
    scope :email, -> (email) { where email: email }
    scope :search, -> (search_term) { where("cedula LIKE ?", "%#{search_term}%") }
end
