class CreateCloudComputings < ActiveRecord::Migration[5.0]
  def change
    create_table :cloud_computings do |t|
      t.string :payload
      t.integer :timestamp
      t.integer :execution_delay

      t.timestamps
    end
  end
end
