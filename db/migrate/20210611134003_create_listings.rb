class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :path
      t.datetime :update_time

      t.timestamps
    end
  end
end
