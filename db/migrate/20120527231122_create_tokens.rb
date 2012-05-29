class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :refresh_token
      t.datetime :expires_in
      t.datetime :expires_at

      t.timestamps
    end
  end
end
