class CreateProcessors < ActiveRecord::Migration[6.0]
  def change
    create_table :processors do |t|
      t.string :name
      t.string :aasm_state, index: true, default: 'staged'
      t.string :version, default: '0.0.1'
      t.integer :ruleset_id
      t.integer :creator_id

      t.timestamps
    end
    add_index :processors, [:name, :version]
  end
end
