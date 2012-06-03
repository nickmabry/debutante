class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_name
      t.boolean :has_voted, default: false
      t.string :email

      t.timestamps
    end
  end
end
