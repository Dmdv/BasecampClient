class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :refresh_token
      t.Bignum :expire_in
      t.Bignum :expire_at

      t.timestamps
    end
  end
end
