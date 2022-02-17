class AddPreviousVersionDate < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :previous_version_date, :datetime
  end
end
