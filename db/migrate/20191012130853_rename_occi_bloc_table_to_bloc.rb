class RenameOcciBlocTableToBloc < ActiveRecord::Migration[5.2]
  def change
    rename_table :occi_blocs, :blocs
  end
end
