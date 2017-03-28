class Usuario < ActiveRecord::Base
    belongs_to :role
  
    scope :role_id, -> (role_id) { where role_id: role_id}
    scope :nacionalidad, -> (nacionalidad) { where nacionalidad: nacionalidad}
    scope :cedula, -> (cedula) { where cedula: cedula }
    scope :username, -> (search_term) { where("username LIKE ?", "%#{search_term}%") }
    scope :email, -> (search_term) { where("email LIKE ?", "%#{search_term}%") }

end
