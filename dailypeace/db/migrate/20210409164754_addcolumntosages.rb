class Addcolumntosages < ActiveRecord::Migration[5.2]
def change
    add_column(:sages,
    :users_id,
    :integer)
  end
end
