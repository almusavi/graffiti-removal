class AddFullNameToGraffitiRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :graffiti_requests, :full_name, :string
    add_column :graffiti_requests, :ward_number, :string
    add_column :graffiti_requests, :total_requests, :string
  end
end
