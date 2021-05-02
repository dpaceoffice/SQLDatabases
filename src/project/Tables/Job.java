package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import project.Table;

public class Job extends Table {

    private int job_id;
    private int position_id;
    private int employee_mode;
    private int pay_type;
    private int pay_rate;

    public Job(Connection connection) {
        super.rows = new HashMap<Integer, Object>();
        fetch(connection);
    }

    private Job(int job_id, int position_id, int employee_mode, int pay_type, int pay_rate) {
        this.job_id = job_id;
        this.position_id = position_id;
        this.employee_mode = employee_mode;
        this.pay_type = pay_type;
        this.pay_rate = pay_rate;
    }

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public int getEmployee_mode() {
        return employee_mode;
    }

    public void setEmployee_mode(int employee_mode) {
        this.employee_mode = employee_mode;
    }

    public int getPay_type() {
        return pay_type;
    }

    public void setPay_type(int pay_type) {
        this.pay_type = pay_type;
    }

    public int getPay_rate() {
        return pay_rate;
    }

    public void setPay_rate(int pay_rate) {
        this.pay_rate = pay_rate;
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
                int position_id = rs.getInt("position_id");
                int employee_mode = rs.getInt("employeemode");
                int pay_type = rs.getInt("pay_type");
                int pay_rate = rs.getInt("pay_rate");
                Job job = new Job(job_id, position_id, employee_mode, pay_type, pay_rate);
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
        return "JobID: "+job_id+" Position ID:"+position_id;
    }

}
