class CreateRulesets < ActiveRecord::Migration[6.0]
  def change
    create_table :rulesets do |t|
      t.string :name
      t.string :aasm_state, index: true, default: 'staged'
      t.string :version, default: '0.0.1'
      t.integer :creator_id

      t.timestamps
    end
    add_index :rulesets, [:name, :version]
  end
end
