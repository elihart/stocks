class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.belongs_to :stock
      t.datetime :date
      t.string :ticker
      t.decimal :open, :precision => 8, :scale => 2
      t.decimal :high, :precision => 8, :scale => 2
      t.decimal :low, :precision => 8, :scale => 2
      t.decimal :close, :precision => 8, :scale => 2
      t.integer :volume
      t.timestamps
    end
  end
end
