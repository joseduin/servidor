class Usuariocanal < ActiveRecord::Base
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
    scope :id_canal, -> (id_canal) { where id_canal: id_canal}
end
