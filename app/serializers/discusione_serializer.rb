class DiscusioneSerializer < ActiveModel::Serializer
  attributes :id, :id_usuario, :id_canal, :titulo, :contenido, :fecha, :estatus
end
