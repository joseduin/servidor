class Prueba < ActiveRecord::Base
    
    #scope :name, -> (search_term) { where("name LIKE ?", "%#{search_term}%") }

    # imagen adjunta
    has_attached_file :avatar, styles: { medium: "1280x720", thumb: "800x600", mini: "400x200" }
    
    # valida que solo se suban imagenes .jpg .png .gif ...
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    
end
