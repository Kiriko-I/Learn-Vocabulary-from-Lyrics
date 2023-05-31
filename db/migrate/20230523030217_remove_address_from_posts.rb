# frozen_string_literal: true

class RemoveAddressFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :address, :string
  end
end
