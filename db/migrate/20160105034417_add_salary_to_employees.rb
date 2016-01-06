class AddSalaryToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :numeric
  end
end
