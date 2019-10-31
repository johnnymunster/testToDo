class AddCompletedToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :completed, :Boolean, default:false
  end
end
