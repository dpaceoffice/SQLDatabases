package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import project.Table;

public class Course extends Table {

	private int courseID;
	private String courseTitle;
	private String courseLvl;
	private String courseDesc;
	private HashMap<Integer, Skill> taught_skills;

	public Course (Connection connection){
		super.rows = new HashMap<Integer, Object>();
		fetch(connection);
	}

	private Course(int id, String title, String level, String desc){
		this.courseID = id;
		this.courseTitle = title;
		this.courseLvl = level;
		this.courseDesc = desc;
	}

	public int getCourseID(){
		return this.courseID;
	}

	public String getCourseTitle(){
		return this.courseTitle;
	}

	public String getCourseLvl(){
		return this.courseLvl;
	}

	public String getCourseDesc(){
		return this.courseDesc;
	}

	public void setCourseID(int id){
		this.courseID = id;
	}

	public void setCourseTitle(String title){
		this.courseTitle = title;
	}

	public void setCourseLvl(String level){
		this.courseLvl = level;
	}

	public void setCourseDesc(String desc){
		this.courseDesc = desc;
	}

	public HashMap<Integer, Skill> getTaught_skills() {
		return taught_skills;
	}


	@Override
	public boolean fetch(Connection con){
		try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM course");
			boolean flag = false;
			while(rs.next()) {
				flag = true;
				int c_ID = rs.getInt("course_id");
				String title = rs.getString("c_title");
				String level = rs.getString("c_level");
				String desc = rs.getString("c_desc");
				Course course = new Course(c_ID, title, level, desc);
				super.rows.put(c_ID, course);
			}
			return flag;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean insert(Connection con) {
		return false;
	}

	@Override
	public boolean delete(Connection con) {
		return false;
	}

}