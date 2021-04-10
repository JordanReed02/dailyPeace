class Createsages < ActiveRecord::Migration[5.2]
  def change
    create_table :sages do |t|
      t.string :thought
      t.string :explenation
      end
    end
  end
