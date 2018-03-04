class CreateAnswerChoice < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id
      t.text :text
      t.timestamps
    end

    add_index :answer_choices, [:question_id, :text], unique: true
  end
end
