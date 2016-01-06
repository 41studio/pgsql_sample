class CreateEmployees < ActiveRecord::Migration
  def change
    enable_extension "plpgsql"

    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps null: false
    end
  end
end
