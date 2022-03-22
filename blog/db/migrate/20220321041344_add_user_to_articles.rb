# frozen_string_literal: true

# Migration for adding a relation between users and articles
class AddUserToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :user, foreign_key: true
  end
end
