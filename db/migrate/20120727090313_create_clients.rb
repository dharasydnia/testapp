class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :redirect_uri
      t.string :identifier
      t.string :secret

      t.timestamps
    end
  end
end
