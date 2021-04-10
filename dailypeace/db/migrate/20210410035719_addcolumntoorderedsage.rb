class Addcolumntoorderedsage < ActiveRecord::Migration[5.2]
  def change
    add_column(
        :orderedsage,
        :sages_id,
        :integer)
  end
end
