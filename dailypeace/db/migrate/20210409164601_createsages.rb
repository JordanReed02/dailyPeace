class Createsages < ActiveRecord::Migration[5.2]
  create_table :sages do |t|
      t.string :thought
      t.string :explenation
      end
    end
