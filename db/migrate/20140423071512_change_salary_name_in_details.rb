class ChangeSalaryNameInDetails < ActiveRecord::Migration
  def change
  	rename_column :details, :salary, :project_name
  end
end
