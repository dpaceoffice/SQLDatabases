package Tables;
public class Job {

    private int job_id;
    private int position_id;
    private int employee_mode;
    private int pay_type;
    private int pay_rate;

    public Job(int job_id, int position_id, int employee_mode, int pay_type, int pay_rate) {
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
}
