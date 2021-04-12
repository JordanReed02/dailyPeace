class Createorders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
  t.string :request
    end
  end
end
