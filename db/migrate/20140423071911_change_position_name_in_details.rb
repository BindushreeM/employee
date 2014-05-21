class ChangePositionNameInDetails < ActiveRecord::Migration
  def change
  	rename_column :details, :position, :discription
  end
end
