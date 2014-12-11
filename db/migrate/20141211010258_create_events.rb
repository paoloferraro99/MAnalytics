class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.references :site, index: true
      t.string :name
      t.string :property_1
      t.string :property_2
      t.datetime :created_on, :updated_on

      t.timestamps
    end
  end
end
