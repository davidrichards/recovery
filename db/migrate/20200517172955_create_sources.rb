class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name, index: true
      t.string :aasm_state, index: true, default: 'staged'
      t.text :citation
      t.integer :creator_id

      t.timestamps
    end
  end
end
