class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.belongs_to :user, :client, :refresh_token
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
