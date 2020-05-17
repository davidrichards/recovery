class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :aasm_state, index: true, default: 'active'
      t.string :version, default: '0.0.1'
      t.string :abbreviation, index: true
      t.integer :level
      t.integer :parent_id, index: true
      t.st_point :centroid, geographic: true
      t.geometry :border

      t.timestamps
    end

    add_index :locations, [:name, :version]
    add_index :locations, :centroid, using: :gist
    add_index :locations, :border, using: :gist
  end
end
