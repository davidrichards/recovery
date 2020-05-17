class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title, index: true
      t.string :aasm_state, index: true, default: 'personal'
      t.text :body
      t.integer :creator_id
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
