ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :posts do |t|
    t.boolean    :published
  end

  create_table :post_translations do |t|
    t.string     :locale
    t.references :post
    t.string     :title
  end

  create_table :versions do |t|
    t.string   :item_type,  null: false
    t.integer  :item_id,    null: false
    t.string   :event,      null: false
    t.string   :whodunnit
    t.text     :object
    t.string   :locale
    t.datetime :created_at
  end

  add_index :versions, [:item_type, :item_id], name: "index_versions_on_item_type_and_item_id"
end
