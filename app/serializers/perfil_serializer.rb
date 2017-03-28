class PerfilSerializer < ActiveModel::Serializer
  attributes :id, :id_usuario, :username, :fecha_nacimiento, :telefono, :titulo, :ocupacion, :pais, :ciudad, :estado, :sobre_mi, :id_imagen
end
