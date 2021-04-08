class Addcolumn < ActiveRecord::Migration[5.2]
  def change
    "ALTER TABLE NAME :Sages TO :sages" +

      "ALTER TABLE sages ADD COLUMN user_id INTEGER";
  end
end
