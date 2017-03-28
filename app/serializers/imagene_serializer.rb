class ImageneSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :data, :filename, :tipo
end
