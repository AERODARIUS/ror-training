# frozen_string_literal: true

# Adding previous version date column to article
class AddPreviousVersionDate < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :previous_version_date, :datetime
  end
end
