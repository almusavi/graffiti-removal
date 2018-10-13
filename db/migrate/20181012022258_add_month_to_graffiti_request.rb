class AddMonthToGraffitiRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :graffiti_requests, :month, :date
  end
end
