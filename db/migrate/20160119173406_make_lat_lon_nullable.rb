class MakeLatLonNullable < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:posts, :lat, true)
    change_column_null(:posts, :lon, true)

  end
end
