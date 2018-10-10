class CreateGraffitiRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :graffiti_requests do |t|
      t.string :last_name
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end
