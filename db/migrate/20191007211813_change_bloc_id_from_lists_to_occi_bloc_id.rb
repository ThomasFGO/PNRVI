class ChangeBlocIdFromListsToOcciBlocId < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :bloc_id, :occi_bloc_id
  end
end
