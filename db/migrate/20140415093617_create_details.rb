class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :salary
      t.text :position
      t.references :employee, index: true

      t.timestamps
    end
  end
end
