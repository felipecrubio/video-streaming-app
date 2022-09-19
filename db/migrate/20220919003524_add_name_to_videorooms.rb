class AddNameToVideorooms < ActiveRecord::Migration[7.0]
  def change
    add_column :videorooms, :name, :string
  end
end
