class CreateWitticisms < ActiveRecord::Migration
  def change
    create_table :witticisms do |t|
      t.text :quote

      t.timestamps
    end
  end
end
