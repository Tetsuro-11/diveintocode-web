class CreateFacebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :facebooks do |t|

      t.timestamps
      t.text :images
      t.text :contents
    end
  end
end
