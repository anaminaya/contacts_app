class AddLatitudeAndLongitude < ActiveRecord::Migration
  def change
    add_column :contacts, :latitude, :float, scale: 6
    add_column :contacts, :longitude, :float, scale: 6
  end
end
