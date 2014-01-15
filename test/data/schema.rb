ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :posts, :force => true do |t|
    t.boolean    :published
    t.timestamps
  end

  create_table :post_translations, :force => true do |t|
    t.string     :locale
    t.references :post
    t.string     :title
    t.timestamps
  end

  create_table :venues, :force => true do |t|
    t.string     :name
    t.timestamps
  end

  create_table :venue_translations, :force => true do |t|
    t.string     :locale
    t.references :venue
    t.string     :description
    t.timestamps
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.string   "locale"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"
end
