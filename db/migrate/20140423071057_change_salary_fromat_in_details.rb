class ChangeSalaryFromatInDetails < ActiveRecord::Migration
  def change
  	change_column :details, :salary, :string
  end
end
