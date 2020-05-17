class CreateRuleSlips < ActiveRecord::Migration[6.0]
  def change
    create_table :rule_slips do |t|
      t.string :aasm_state, index: true, default: 'active'
      t.integer :rule_id
      t.integer :slip_id

      t.timestamps
    end
  end
end
