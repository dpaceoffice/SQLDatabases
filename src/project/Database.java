package project;

import java.sql.*;
import java.util.Map;

import project.Helpers.Duration;
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
            con = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "dwpace", "#");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getCon() {
        return con;
    }

    public Thread load_skill_table() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                loaded_skills = new Skill(con).rows;
            }
        });
        return thread;
    }

    public Thread load_person_table() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                loaded_persons = new Person(con).rows;
            }
        });
        return thread;
    }

    public Thread load_jobs_table() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                loaded_jobs = new Job(con).rows;
            }
        });
        return thread;
    }

    public Thread load_owned_skills_relation() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                try {
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM p_has");
                    while (rs.next()) {
                        int person_id = rs.getInt("person_id");
                        int skill_id = rs.getInt("skill_id");
                        Person person = (Person) loaded_persons.get(person_id);
                        Skill skill = (Skill) loaded_skills.get(skill_id);
                        person.addSkill(skill_id, skill);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        return thread;
    }

    public Thread load_owned_jobs_relation() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                try {
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM p_works");
                    while (rs.next()) {
                        int person_id = rs.getInt("person_id");
                        int job_id = rs.getInt("job_id");
                        Date startDate = rs.getDate("start_date");
                        Date endDate = rs.getDate("end_date");
                        Person person = (Person) loaded_persons.get(person_id);
                        Job job = (Job) loaded_jobs.get(job_id);
                        person.addJob(job_id, job, new Duration(startDate, endDate));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        return thread;
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

    private void startThreads() {
        
        /**
         * Main table values
         */
        Thread pth = load_person_table();
        Thread sth = load_skill_table();
        Thread jth = load_jobs_table();
        
        /**
         * Table relations
         */
        Thread srth = load_owned_skills_relation();
        Thread jrth = load_owned_jobs_relation();

        /**
         * Starts populating the hashmaps with data concurrently..
         */
        pth.start();
        sth.start();
        jth.start();
        
        /**
         * We're waiting for these threads, allowing them to continue would mean having an open thread to feed information for each list..
         * Because we start them all at the same time it should improve our time. When every table is more populated this will improve time significantly.
         */
        while (pth.isAlive() || sth.isAlive() || jth.isAlive()) {
            continue;
        }

        /**
         * Once the tables are loaded we can go ahead and update the relations later. 
         * This is possible because we are creating object references and storing them. 
         * To load relations we must simply load the object and write some additional characteristics
         */
        srth.start();
        jrth.start();
    }

    public boolean init() {
        startThreads();
        return !loaded_jobs.isEmpty() && !loaded_persons.isEmpty() && !loaded_skills.isEmpty();
    }
}
