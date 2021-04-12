class Addcolumntoorderedsages < ActiveRecord::Migration[5.2]
  def change
    add_column(
        :orderedsages,
        :sages_id,
        :integer)
  end
end
