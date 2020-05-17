class CreateAttributions < ActiveRecord::Migration[6.0]
  def change
    create_table :attributions do |t|
      t.string :label, index: true
      t.string :aasm_state, index: true, default: 'active'
      t.integer :datum_id
      t.integer :attributable_id
      t.string :attributable_type

      t.timestamps
    end
  end
end
