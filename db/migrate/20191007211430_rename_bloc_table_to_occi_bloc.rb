class RenameBlocTableToOcciBloc < ActiveRecord::Migration[5.2]
  def change
    rename_table :blocs, :occi_blocs #use the pluralized name of tables here
  end
end
