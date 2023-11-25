# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_22_223810) do
  create_table "dispositivos", force: :cascade do |t|
    t.string "nome"
    t.string "codigo"
    t.boolean "ativo"
    t.string "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historico_localizacaos", force: :cascade do |t|
    t.integer "dispositivo_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dispositivo_id"], name: "index_historico_localizacaos_on_dispositivo_id"
  end

  create_table "localizacaos", force: :cascade do |t|
    t.string "device_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metricas", force: :cascade do |t|
    t.integer "dispositivo_id"
    t.string "marca"
    t.integer "quantidade_posicao"
    t.float "total_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "historico_localizacaos", "dispositivos"
end
