class Employee < ActiveRecord::Base

  def self.get_employee_salaries
    result = ActiveRecord::Base.connection.execute("select * from get_employee()")
    result.to_a
  end

end
