class CreatePoll < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title
      t.integer :author_id
      t.timestamps
    end

    add_index :polls, [:title, :author_id], unique: true
  end
end
