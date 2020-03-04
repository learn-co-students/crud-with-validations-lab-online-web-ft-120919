class Renamecolumn < ActiveRecord::Migration[5.0]
  def change
    change_table :songs do |t|
      t.rename :released_year, :release_year
    end
  end
end
