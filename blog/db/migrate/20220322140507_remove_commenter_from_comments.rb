# frozen_string_literal: true

# Removing commenter column, using user_id instead
class RemoveCommenterFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :commenter, :string
  end
end
