class AddUserIdToReponse < ActiveRecord::Migration[5.1]
  def change

    add_column :user_id
  end
end
