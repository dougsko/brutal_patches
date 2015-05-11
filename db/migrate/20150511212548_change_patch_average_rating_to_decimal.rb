class ChangePatchAverageRatingToDecimal < ActiveRecord::Migration
  def change
      change_column :patches, :average_rating, :decimal
  end
end
