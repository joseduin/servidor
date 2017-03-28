json.extract! comentariodiscucion, :id, :id_post, :id_usuario, :contenido, :fecha, :created_at, :updated_at
json.url comentariodiscucion_url(comentariodiscucion, format: :json)