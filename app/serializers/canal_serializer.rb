class CanalSerializer < ActiveModel::Serializer
  attributes :id, :id_creador, :id_interes, :id_imagen, :nombre, :descripcion, :estatus
end
