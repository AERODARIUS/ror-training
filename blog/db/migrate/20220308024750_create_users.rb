# frozen_string_literal: true

# Migrations for creating user model
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.date :birthday

      t.timestamps
    end
  end
end
