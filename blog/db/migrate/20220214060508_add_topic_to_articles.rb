class AddTopicToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :topic, :integer, default: 0
  end
end
