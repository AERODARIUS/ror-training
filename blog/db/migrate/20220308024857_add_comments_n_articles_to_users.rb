# frozen_string_literal: true

# Migration to add relations of comments and articles with user
class AddCommentsNArticlesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :comments, foreign_key: true
    add_reference :users, :articles, foreign_key: true
  end
end
