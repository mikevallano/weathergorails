class CreateRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      t.belongs_to :location, foreign_key: true
      t.integer :temp
      t.string :status

      t.timestamps
    end
  end
end
