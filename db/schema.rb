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

ActiveRecord::Schema.define(version: 20150511212548) do

  create_table "patches", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description"
    t.string   "sub_fifth",      limit: 255
    t.string   "overtone",       limit: 255
    t.string   "ultra_saw",      limit: 255
    t.string   "saw",            limit: 255
    t.string   "pulse_width",    limit: 255
    t.string   "square",         limit: 255
    t.string   "metalizer",      limit: 255
    t.string   "triangle",       limit: 255
    t.string   "cutoff",         limit: 255
    t.string   "mode",           limit: 255
    t.string   "resonance",      limit: 255
    t.string   "env_amt",        limit: 255
    t.string   "brute_factor",   limit: 255
    t.string   "kbd_tracking",   limit: 255
    t.string   "modmatrix",      limit: 255
    t.string   "octave",         limit: 255
    t.string   "volume",         limit: 255
    t.string   "glide",          limit: 255
    t.string   "mod_wheel",      limit: 255
    t.string   "amount",         limit: 255
    t.string   "wave",           limit: 255
    t.string   "rate",           limit: 255
    t.string   "sync",           limit: 255
    t.string   "env_amt_2",      limit: 255
    t.string   "vca",            limit: 255
    t.string   "attack",         limit: 255
    t.string   "decay",          limit: 255
    t.string   "sustain",        limit: 255
    t.string   "release",        limit: 255
    t.string   "pattern",        limit: 255
    t.string   "play",           limit: 255
    t.string   "rate_2",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "average_rating"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "patch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
