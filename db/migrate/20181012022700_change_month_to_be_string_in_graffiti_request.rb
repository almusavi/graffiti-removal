class ChangeMonthToBeStringInGraffitiRequest < ActiveRecord::Migration[5.2]
  def change
  	change_column :graffiti_requests, :month, :string
  end
end
