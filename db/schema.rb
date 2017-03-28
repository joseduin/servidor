# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170327193607) do

  create_table "canalinteres", force: :cascade do |t|
    t.integer  "id_canal"
    t.integer  "id_interes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canals", force: :cascade do |t|
    t.integer  "id_creador"
    t.integer  "id_decanato"
    t.integer  "id_imagen"
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "id_interes"
  end

  create_table "chats", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_usuario2"
    t.text     "asunto"
    t.text     "contenido"
    t.integer  "estatus"
    t.datetime "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "categoria"
  end

  create_table "comentariodiscucions", force: :cascade do |t|
    t.integer  "id_post"
    t.integer  "id_usuario"
    t.string   "contenido"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.integer  "id_post"
    t.integer  "id_usuario"
    t.text     "contenido"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decanatos", force: :cascade do |t|
    t.string   "iniciales"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discusiones", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_canal"
    t.string   "titulo"
    t.string   "contenido"
    t.datetime "fecha"
    t.integer  "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "egresados", force: :cascade do |t|
    t.string   "nacionalidad"
    t.integer  "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.datetime "fecha_egreso"
    t.string   "carrera"
    t.string   "decanato"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "galeria", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imagenes", force: :cascade do |t|
    t.string   "nombre"
    t.binary   "data"
    t.string   "filename"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interes", force: :cascade do |t|
    t.integer  "id_decanato"
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "id_post"
    t.integer  "id_usuario"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perfils", force: :cascade do |t|
    t.integer  "id_usuario"
    t.string   "username"
    t.datetime "fecha_nacimiento"
    t.string   "telefono"
    t.string   "titulo"
    t.string   "ocupacion"
    t.string   "pais"
    t.string   "ciudad"
    t.string   "estado"
    t.text     "sobre_mi"
    t.integer  "id_imagen"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "tipo"
    t.integer  "id_usuario"
    t.integer  "id_canal"
    t.string   "titulo"
    t.text     "contenido"
    t.datetime "fecha"
    t.integer  "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seguidores", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_seguidor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seguidos", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_seguido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuariocanals", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_canal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuariointeres", force: :cascade do |t|
    t.integer  "id_usuario"
    t.integer  "id_interes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "username"
    t.string   "pass"
    t.string   "email"
    t.integer  "estatus"
    t.string   "cedula"
    t.string   "nacionalidad"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "usuarios", ["role_id"], name: "index_usuarios_on_role_id"

end
