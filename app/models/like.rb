class Like < ActiveRecord::Base
    scope :id_post, -> (id_post) { where id_post: id_post}
    scope :id_usuario, -> (id_usuario) { where id_usuario: id_usuario}
end
