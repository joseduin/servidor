class ComentariodiscucionSerializer < ActiveModel::Serializer
  attributes :id, :id_post, :id_usuario, :contenido, :fecha
end
