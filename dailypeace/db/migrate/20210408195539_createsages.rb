class Createsages < ActiveRecord::Migration[5.2]
  def change
    create_table :Sages do |t|
    t.string :thoughts
    t.string :analysis
    t.string :explenation
    end
  end
end
