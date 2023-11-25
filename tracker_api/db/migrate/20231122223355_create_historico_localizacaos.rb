class CreateHistoricoLocalizacaos < ActiveRecord::Migration[7.1]
  def change
    create_table :historico_localizacaos do |t|
      t.references :dispositivo, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.datetime :timestamp

      t.timestamps
    end
  end
end
