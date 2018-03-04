class CreateResponse < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id
      t.integer :question_id
      t.timestamps
    end

    add_index :responses, [:answer_choice_id, :question_id], unique: true
  end
end
