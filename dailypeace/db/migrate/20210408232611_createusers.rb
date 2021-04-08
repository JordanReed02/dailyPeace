class Createusers < ActiveRecord::Migration[5.2]
  def change
          create_table :users do |t|
            "id INTEGER PRIMARY KEY"
            t.string :username
            t.string :password_digest

            t.timestamps null: false
          end
        end
      end
