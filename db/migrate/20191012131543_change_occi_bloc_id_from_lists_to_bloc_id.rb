class ChangeOcciBlocIdFromListsToBlocId < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :occi_bloc_id, :bloc_id
  end
end
