class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.string :label, index: true
      t.string :type
      t.string :aasm_state, index: true, default: 'active'
      t.integer :processor_id
      t.integer :reference_id
      t.string :reference_type
      t.float :float_value
      t.integer :integer_value
      t.string :string_value
      t.text :text_value

      t.timestamps
    end
  end
end
