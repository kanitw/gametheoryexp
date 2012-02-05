class AddStateToGameone < ActiveRecord::Migration
  def change
    add_column :gameones, :state, :integer

  end
end
