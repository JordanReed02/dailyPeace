class Createsages < ActiveRecord::Migration[5.2]
  def change
    create_table :Sage do |t|
    t.string :thought
    t.string :explenation
    t.string :analysis
    end
  end
end
