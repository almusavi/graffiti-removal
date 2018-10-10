class RemoveYearFromGraffitiRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :graffiti_requests, :year, :string
  end
end
