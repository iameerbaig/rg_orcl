CREATE OR REPLACE TRIGGER demo.update_job_history
  AFTER UPDATE OF job_id, department_id ON demo.employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate, 
                  :old.job_id, :old.department_id);
END;
/