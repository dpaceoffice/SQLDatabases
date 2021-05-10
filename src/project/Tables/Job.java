package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import project.Table;

public class Job extends Table {

    private int job_id;
    private int employee_mode;

    public Job(Connection connection) {
        super.rows = new HashMap<Integer, Object>();
        fetch(connection);
    }

    private Job(int job_id, int employee_mode) {
        this.job_id = job_id;
        this.employee_mode = employee_mode;
    }

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public int getEmployee_mode() {
        return employee_mode;
    }

    public void setEmployee_mode(int employee_mode) {
        this.employee_mode = employee_mode;
    }


    @Override
    public boolean fetch(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM jobs");
            boolean flag = false;
            while (rs.next()) {
                flag = true;
                int job_id = rs.getInt("job_id");
                int employee_mode = rs.getInt("employeemode");
                Job job = new Job(job_id, employee_mode);
                super.rows.put(job_id, job);
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(Connection con) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean insert(Connection con) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String toString() {
        return "JobID: "+job_id;
    }

}
