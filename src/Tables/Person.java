package Tables;

import java.util.HashMap;

public class Person {
    
    private int person_id;
    private String first_name;
    private String last_name;
    private String email;
    private int gender;
    private String phone;
    private HashMap<Integer, Skill> owned_skills;
    private HashMap<Integer, Job> job_list;
    private HashMap<Integer, Duration> job_date;

    public Person(int person_id, String first_name, String last_name, String email, int gender, String phone) {
        this.person_id = person_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
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
}