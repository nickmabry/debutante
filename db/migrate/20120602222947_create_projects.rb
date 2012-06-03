class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :short_description
      t.string :description
      t.integer :user_id
      t.integer :votes, default: 0
      t.string :url

      t.timestamps
    end
  end
end
