class CreateQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :poll_id
      t.timestamps
    end

    add_index :questions,[:text,:poll_id], unique: true
  end
end
