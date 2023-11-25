class CreateMetricas < ActiveRecord::Migration[7.1]
  def change
    create_table :metricas do |t|
      t.integer :dispositivo_id
      t.string :marca
      t.integer :quantidade_posicao
      t.float :total_km

      t.timestamps
    end
  end
end
