# frozen_string_literal: true

# Migration for adding a relation between users and comments
class AddUserToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true
  end
end
