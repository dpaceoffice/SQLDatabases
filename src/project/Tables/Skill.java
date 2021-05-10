package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import project.Table;

public class Skill extends Table {

    private int skill_id;
    private String title;
    private String description;

    public Skill(Connection connection) {
        super.rows = new HashMap<Integer, Object>();
        fetch(connection);
    }

    private Skill(int skill_id, String title, String description) {
        this.skill_id = skill_id;
        this.title = title;
        this.description = description;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public boolean fetch(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM skill");
            boolean flag = false;
            while (rs.next()) {
                flag = true;
                int skill_id = rs.getInt("skill_id");
                String title = rs.getString("title");
                String desc = rs.getString("skill_desc");
                Skill skill = new Skill(skill_id, title, desc);
                super.rows.put(skill_id, skill);
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
        return title;
    }

}
