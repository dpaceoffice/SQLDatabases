package project;

import java.sql.*;
import java.util.Map;

import project.Tables.Duration;
import project.Tables.Job;
import project.Tables.Person;
import project.Tables.Skill;

/**
 * Singleton class to handle SQL database
 */
public class Database {
    private static Database db = null;
    private Connection con = null;
    private Map<Integer, Object> loaded_jobs;
    private Map<Integer, Object> loaded_skills;
    private Map<Integer, Object> loaded_persons;

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
            con = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "dwpace", "3LdMtRsX");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getCon() {
        return con;
    }

    public boolean load_skill_table() {
        loaded_skills = new Skill(con).rows;
        return !loaded_skills.isEmpty();
    }

    public boolean load_person_table() {
        loaded_persons = new Person(con).rows;
        return !loaded_persons.isEmpty();
    }

    public boolean load_jobs_table() {
        loaded_jobs = new Job(con).rows;
        return !loaded_jobs.isEmpty();
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
                Person person = (Person) loaded_persons.get(person_id);
                Skill skill = (Skill) loaded_skills.get(skill_id);
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
                Person person = (Person) loaded_persons.get(person_id);
                Job job = (Job) loaded_jobs.get(job_id);
                person.addJob(job_id, job, new Duration(startDate, endDate));
            }
            return flag;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Map<Integer, Object> getLoaded_jobs() {
        return loaded_jobs;
    }

    public Map<Integer, Object> getLoaded_skills() {
        return loaded_skills;
    }

    public Map<Integer, Object> getLoaded_persons() {
        return loaded_persons;
    }

    public boolean init() {
        boolean success = false;
        success = load_person_table() && load_skill_table() && load_jobs_table() && load_owned_skills_relation()
                && load_owned_jobs_relation();
        return success;
    }
}
