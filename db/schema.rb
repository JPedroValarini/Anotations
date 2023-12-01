ActiveRecord::Schema[7.0].define(version: 2023_12_01_153632) do

  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "categories", array: true
    t.datetime "reminder_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
