class EgresadoSerializer < ActiveModel::Serializer
    attributes :id, :nacionalidad, :cedula, :nombre, :apellido, :email, :fecha_egreso, :carrera, :decanato
end
