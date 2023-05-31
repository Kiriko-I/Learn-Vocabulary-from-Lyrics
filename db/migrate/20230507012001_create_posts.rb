# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :prefecture, null: false, default: 0
      t.string :city, null: true
      t.string :landmark, null: true
      t.integer :sidewalk, null: false, default: 0
      t.integer :snow_height, null: false, default: 0
      t.integer :snow_state, null: false, default: 0
      t.text :message, null: true

      t.timestamps
    end
  end
end
