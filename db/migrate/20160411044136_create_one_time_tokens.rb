class CreateOneTimeTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :one_time_tokens do |t|
      t.references :user, null:false
      t.string :token, limit: 128
      t.datetime :expires_at, null: false
      t.timestamps null: false
    end

    add_index :one_time_tokens, :token
  end
end
