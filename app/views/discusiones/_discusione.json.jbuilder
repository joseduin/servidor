json.extract! discusione, :id, :id_usuario, :id_canal, :titulo, :contenido, :fecha, :estatus, :created_at, :updated_at
json.url discusione_url(discusione, format: :json)