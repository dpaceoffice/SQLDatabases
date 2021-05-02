import java.sql.*;
import java.util.HashMap;

import Tables.Duration;
import Tables.Job;
import Tables.Person;
import Tables.Skill;

/**
 * Singleton class to handle SQL database
 */
public class Database {
    private Connection con = null;
    private static Database db = null;
    private static HashMap<Integer, Job> loaded_jobs = new HashMap<Integer, Job>();
    private static HashMap<Integer, Skill> loaded_skills = new HashMap<Integer, Skill>();
    private static HashMap<Integer, Person> loaded_persons = new HashMap<Integer, Person>();

    /**
     * Gets the instance of singleton Database or creates it
     * 
     * @return Database instance
     */
    public static Database getInstance() {
        if (db == null)
            db = new Database();
        return db;
    }

    /**
     * Singleton constructor initilizes the connection once for every thread to use
     */
    private Database() {
        try {
            con = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "dwpace", "####");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getCon() {
        return con;
    }

    public boolean load_skill_table() {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM skill");
            boolean flag = false;
            while (rs.next()) {
                flag = true;
                int skill_id = rs.getInt("skill_id");
                String title = rs.getString("title");
                String desc = rs.getString("s_desc");
                int level = rs.getInt("s_level");
                Skill skill = new Skill(skill_id, title, desc, level);
                loaded_skills.put(skill_id, skill);
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean load_person_table() {
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
                loaded_persons.put(person_id, person);
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean load_jobs_table() {
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
                loaded_jobs.put(job_id, job);
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean load_owned_skills_relation() {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM p_has");
            boolean flag = false;
            while (rs.next()) {
                flag = true;
                int person_id = rs.getInt("person_id");
                int skill_id = rs.getInt("skill_id");
                Person person = loaded_persons.get(person_id);
                Skill skill = loaded_skills.get(skill_id);
                person.addSkill(skill_id, skill);
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean load_owned_jobs_relation() {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM p_works");
            boolean flag = false;
            while (rs.next()) {
                flag = true;
                int person_id = rs.getInt("person_id");
                int job_id = rs.getInt("job_id");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                Person person = loaded_persons.get(person_id);
                Job job = loaded_jobs.get(job_id);
                person.addJob(job_id, job, new Duration(startDate, endDate));
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean init() {
        boolean success = false;
        success = load_person_table();
        success = load_skill_table();
        success = load_jobs_table();
        success = load_owned_skills_relation();
        success = load_owned_jobs_relation();
        return success;
    }
}
