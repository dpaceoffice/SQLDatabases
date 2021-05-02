package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import project.Table;
import project.Helpers.Duration;

public class Person extends Table {
    
    private int person_id;
    private String first_name;
    private String last_name;
    private String email;
    private int gender;
    private String phone;
    private HashMap<Integer, Skill> owned_skills;
    private HashMap<Integer, Job> job_list;
    private HashMap<Integer, Duration> job_date;

    
    public Person(Connection connection) {
        super.rows = new HashMap<Integer, Object>();
        fetch(connection);
    }


    private Person(int person_id, String first_name, String last_name, String email, int gender, String phone) {
        this.person_id = person_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.owned_skills = new HashMap<Integer, Skill>();
        this.job_list = new HashMap<Integer, Job>();
        this.job_date = new HashMap<Integer, Duration>();
    }
        
    public int getPerson_id() {
        return person_id;
    }


    public void setPerson_id(int person_id) {
        this.person_id = person_id;
    }


    public String getFirst_name() {
        return first_name;
    }


    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }


    public String getLast_name() {
        return last_name;
    }


    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public int getGender() {
        return gender;
    }


    public void setGender(int gender) {
        this.gender = gender;
    }


    public String getPhone() {
        return phone;
    }


    public void setPhone(String phone) {
        this.phone = phone;
    }

    public HashMap<Integer, Skill> get_skills() {
        return owned_skills;
    }

    public boolean hasSkill(int skill_id) {
        return owned_skills.containsKey(skill_id);
    }

    public void addSkill(int skill_id, Skill skill) {
        if(!hasSkill(skill_id))
            this.owned_skills.put(skill_id, skill);
    }

    public boolean hasJob(int job_id) {
        return job_list.containsKey(job_id);
    }

    public void addJob(int job_id, Job job, Duration duration) {
        if(!hasJob(job_id)) {
            this.job_list.put(job_id, job);
            this.job_date.put(job_id, duration);
        }
    }


	@Override
	public boolean fetch(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM person");
            boolean flag = false;
            while (rs.next()) {
                flag = true;
                int person_id = rs.getInt("person_id");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String email = rs.getString("email");
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                Person person = new Person(person_id, first_name, last_name, email, gender, phone);
                super.rows.put(person_id, person);
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
        return (first_name.replace(" ", "") +" "+last_name.replace(" ", ""));
    }

}