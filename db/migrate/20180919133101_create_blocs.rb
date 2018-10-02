class CreateBlocs < ActiveRecord::Migration[5.2]
  def change
    create_table :blocs do |t|
      t.string :fr_name

      t.timestamps
    end
  end
end
