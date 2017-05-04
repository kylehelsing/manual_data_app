class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.string :point_type
      t.integer :point_value
      t.text :aux_data

      t.timestamps null: false
    end
  end
end
