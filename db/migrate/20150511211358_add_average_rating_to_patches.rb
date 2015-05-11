class AddAverageRatingToPatches < ActiveRecord::Migration
  def change
    add_column :patches, :average_rating, :integer
  end
end
