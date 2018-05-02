class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id,         null: false
      t.integer :receiver_id,       null: false
      t.string :chat,               null: false, default: ""

      t.timestamps null: false
    end
  end
end
