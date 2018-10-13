class RemoveMonthFromGraffitiRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :graffiti_requests, :month, :date
  end
end
