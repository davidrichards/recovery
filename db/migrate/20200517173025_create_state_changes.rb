class CreateStateChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :state_changes do |t|
      t.integer :state_changeable_id
      t.string :state_changeable_type
      t.integer :person_id
      t.string :role_name

      t.timestamps
    end
  end
end
