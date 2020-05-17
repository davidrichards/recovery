class CreateSlips < ActiveRecord::Migration[6.0]
  def change
    create_table :slips do |t|
      t.string :name, index: true
      t.string :aasm_state, index: true, default: 'staged'
      t.text :body
      t.integer :creator_id
      t.integer :source_id

      t.timestamps
    end
  end
end
