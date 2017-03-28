class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :username, :pass, :email, :estatus, :cedula, :nacionalidad
  has_one :role
end
