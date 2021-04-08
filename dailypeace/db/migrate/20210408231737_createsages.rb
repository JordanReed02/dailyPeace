class Createsages < ActiveRecord::Migration[5.2]
  def change
    create_table :Sages do |t|
  "id INTEGER PRIMARY KEY";
   t.string :thoughts
   t.string :tips
   end
 end
end
