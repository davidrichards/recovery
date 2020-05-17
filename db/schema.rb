# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_173025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "attributions", force: :cascade do |t|
    t.string "label"
    t.string "aasm_state", default: "active"
    t.integer "datum_id"
    t.integer "attributable_id"
    t.string "attributable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_attributions_on_aasm_state"
    t.index ["label"], name: "index_attributions_on_label"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "aasm_state", default: "personal"
    t.text "body"
    t.integer "creator_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_comments_on_aasm_state"
    t.index ["title"], name: "index_comments_on_title"
  end

  create_table "data", force: :cascade do |t|
    t.string "label"
    t.string "type"
    t.string "aasm_state", default: "active"
    t.integer "processor_id"
    t.integer "reference_id"
    t.string "reference_type"
    t.float "float_value"
    t.integer "integer_value"
    t.string "string_value"
    t.text "text_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_data_on_aasm_state"
    t.index ["label"], name: "index_data_on_label"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "aasm_state", default: "active"
    t.string "version", default: "0.0.1"
    t.string "abbreviation"
    t.integer "level"
    t.integer "parent_id"
    t.geography "centroid", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.geometry "border", limit: {:srid=>0, :type=>"geometry"}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_locations_on_aasm_state"
    t.index ["abbreviation"], name: "index_locations_on_abbreviation"
    t.index ["border"], name: "index_locations_on_border", using: :gist
    t.index ["centroid"], name: "index_locations_on_centroid", using: :gist
    t.index ["name", "version"], name: "index_locations_on_name_and_version"
    t.index ["parent_id"], name: "index_locations_on_parent_id"
  end

  create_table "processors", force: :cascade do |t|
    t.string "name"
    t.string "aasm_state", default: "staged"
    t.string "version", default: "0.0.1"
    t.integer "ruleset_id"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_processors_on_aasm_state"
    t.index ["name", "version"], name: "index_processors_on_name_and_version"
  end

  create_table "rule_slips", force: :cascade do |t|
    t.string "aasm_state", default: "active"
    t.integer "rule_id"
    t.integer "slip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_rule_slips_on_aasm_state"
  end

  create_table "rules", force: :cascade do |t|
    t.string "name"
    t.string "aasm_state", default: "staged"
    t.text "body"
    t.integer "creator_id"
    t.integer "ruleset_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_rules_on_aasm_state"
    t.index ["name"], name: "index_rules_on_name"
  end

  create_table "rulesets", force: :cascade do |t|
    t.string "name"
    t.string "aasm_state", default: "staged"
    t.string "version", default: "0.0.1"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_rulesets_on_aasm_state"
    t.index ["name", "version"], name: "index_rulesets_on_name_and_version"
  end

  create_table "slips", force: :cascade do |t|
    t.string "name"
    t.string "aasm_state", default: "staged"
    t.text "body"
    t.integer "creator_id"
    t.integer "source_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_slips_on_aasm_state"
    t.index ["name"], name: "index_slips_on_name"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "aasm_state", default: "staged"
    t.text "citation"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aasm_state"], name: "index_sources_on_aasm_state"
    t.index ["name"], name: "index_sources_on_name"
  end

  create_table "state_changes", force: :cascade do |t|
    t.integer "state_changeable_id"
    t.string "state_changeable_type"
    t.integer "person_id"
    t.string "role_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
