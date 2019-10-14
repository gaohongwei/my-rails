class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :city_id
      t.date :date
      t.integer :low
      t.integer :high
      t.integer :weather

      t.timestamps
    end
  end
end
