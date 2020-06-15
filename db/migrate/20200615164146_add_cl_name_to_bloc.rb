class AddClNameToBloc < ActiveRecord::Migration[5.2]
  def change
    add_column :blocs, :cl_name, :string
  end
end
