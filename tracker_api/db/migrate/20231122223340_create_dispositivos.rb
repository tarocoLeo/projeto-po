class CreateDispositivos < ActiveRecord::Migration[7.1]
  def change
    create_table :dispositivos do |t|
      t.string :nome
      t.string :codigo
      t.boolean :ativo
      t.string :marca

      t.timestamps
    end
  end
end
