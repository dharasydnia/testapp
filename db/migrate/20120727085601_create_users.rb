class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :group_strings, :limit => 10000
      t.string :guid
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
