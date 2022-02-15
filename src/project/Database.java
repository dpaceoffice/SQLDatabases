package project;

import java.sql.*;
import java.util.Map;

import project.RelationTables.PersonJobs;
import project.RelationTables.PersonSkill;
import project.RelationTables.SectionCourse;
import project.RelationTables.SectionSkill;
import project.Tables.Course;
import project.Tables.Job;
import project.Tables.Person;
import project.Tables.Section;
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
    private Map<Integer, Object> loaded_courses;
    private Map<Integer, Object> loaded_sections;

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
            con = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "", "");
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

    public Thread load_courses_table() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                loaded_courses = new Course(con).rows;
            }
        });
        return thread;
    }

    public Thread load_sections_table() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                loaded_sections = new Section(con).rows;
            }
        });
        return thread;
    }

    public Thread load_owned_jobs_relation() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                new PersonJobs(loaded_persons, loaded_jobs, "person_job", con);
            }
        });
        return thread;
    }

    public Thread load_owned_skills_relation() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                new PersonSkill(loaded_persons, loaded_skills, "person_skill", con);
            }
        });
        return thread;
    }

    public Thread load_section_course_relation() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                new SectionCourse(loaded_sections, loaded_courses, "section_course", con);
            }
        });
        return thread;
    }

    public Thread load_section_skill_relation() {
        Thread thread = new Thread(new Runnable() {
            public void run() {
                new SectionSkill(loaded_sections, loaded_skills, "section_skill", con);
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
    public Map<Integer, Object> getLoaded_courses() {
        return loaded_courses;
    }
    public Map<Integer, Object> getLoaded_sections() {
        return loaded_sections;
    }

    private void startThreads() {
        
        /**
         * Main table values
         */
        Thread pth = load_person_table();
        Thread sth = load_skill_table();
        Thread jth = load_jobs_table();
        Thread cth = load_courses_table();
        Thread secth = load_sections_table();
        
        /**
         * Table relations
         */
        Thread srth = load_owned_skills_relation();
        Thread jrth = load_owned_jobs_relation();
        Thread scrth = load_section_course_relation();
        Thread ssrth = load_section_skill_relation();

        /**
         * Starts populating the hashmaps with data concurrently..
         */
        pth.start();
        sth.start();
        jth.start();
        cth.start();
        secth.start();
        
        /**
         * We're waiting for these threads, allowing them to continue would mean having an open thread to feed information for each list..
         * Because we start them all at the same time it should improve our time. When every table is more populated this will improve time significantly.
         */
        while (pth.isAlive() || sth.isAlive() || jth.isAlive() || cth.isAlive()) {
            continue;
        }

        /**
         * Once the tables are loaded we can go ahead and update the relations later. 
         * This is possible because we are creating object references and storing them. 
         * To load relations we must simply load the object and write some additional characteristics
         */
        srth.start();
        jrth.start();
        scrth.start();
        ssrth.start();
    }

    public boolean init() {
        startThreads();
        System.out.println(""+!loaded_jobs.isEmpty()+" "+!loaded_persons.isEmpty()+" "+!loaded_skills.isEmpty()+" "+!loaded_courses.isEmpty()+" "+!loaded_sections.isEmpty()+"");
        return !loaded_jobs.isEmpty() && !loaded_persons.isEmpty() && !loaded_skills.isEmpty() && !loaded_courses.isEmpty() && !loaded_sections.isEmpty();
    }
}
