class CreateDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :docs do |t|
      t.string :name
      t.integer :size
      t.datetime :update_time
      t.string :path
      t.string :type_doc
      t.references :listing, index: true, foreign_key: true

      t.timestamps
    end
  end
end
