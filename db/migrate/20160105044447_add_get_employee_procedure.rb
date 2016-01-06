class AddGetEmployeeProcedure < ActiveRecord::Migration
  def up
    execute <<-SPROC
CREATE OR REPLACE FUNCTION get_employee() RETURNS 
TABLE(
  eml character varying,
  full_name text,
  salary_status text
)
AS $body$
  BEGIN  
    RETURN QUERY 
    SELECT email, concat_ws(' ', first_name, last_name) as full_name,
    CASE 
    WHEN salary > 6000.00 THEN 'High Salary'               
    WHEN salary = 3000.00 THEN '2nd grade salary'              
    ELSE 'Low Salary'          
    END
    AS salary_status
    FROM employees;  
  END;
$body$ LANGUAGE 'plpgsql';
    SPROC
  end

  def down
    execute "DROP FUNCTION IF EXISTS get_employee()"
  end

end
