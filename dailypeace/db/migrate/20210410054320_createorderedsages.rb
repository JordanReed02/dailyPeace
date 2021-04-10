class Createorderedsages < ActiveRecord::Migration[5.2]
  def change
    create_table :orderedsages do |t|
    t.integer :quantity

    end
  end
end
