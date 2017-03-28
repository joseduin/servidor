class ChatSerializer < ActiveModel::Serializer
  attributes :id, :id_usuario, :id_usuario2, :asunto, :contenido, :estatus, :fecha, :categoria
end
