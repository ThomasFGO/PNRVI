class AddPhotosToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ph_one, :string
    add_column :items, :ph_two, :string
    add_column :items, :ph_three, :string
    add_column :items, :ph_four, :string
    add_column :items, :ph_five, :string
  end
end
