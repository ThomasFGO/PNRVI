class AddRankToBlocs < ActiveRecord::Migration[5.2]
  def change
    add_column :blocs, :rank, :integer
  end
end
