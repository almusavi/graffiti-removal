class ChangeMonthToBeDateInGraffitiRequest < ActiveRecord::Migration[5.2]
  def change
  	    change_column :graffiti_requests, :month, "date USING CAST(month AS date)"
  end
end
