class PostSerializer < ActiveModel::Serializer
  attributes :id, :tipo, :id_usuario, :id_canal, :titulo, :contenido, :fecha, :estatus
end
