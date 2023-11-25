class CreateLocalizacaos < ActiveRecord::Migration[7.1]
  def change
    create_table :localizacaos do |t|
      t.string :device_id
      t.float :latitude
      t.float :longitude
      t.datetime :timestamp

      t.timestamps
    end
  end
end
