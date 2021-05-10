package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import java.util.HashMap;

import project.Table;

public class Section extends Table{

	private int sectionID;
	private int sectionYear;
	private Date sectionCompDate;
	private Date sectionOfferDate;
	private int sectionFormat;
	private int sectionPrice;
	private HashMap<Integer, Skill> taught_skills;

	public Section (Connection connection){
		super.rows = new HashMap<Integer, Object>();
		fetch(connection);
	}

	private Section(int id, int year, Date completionDate, Date offeringDate, int format, int price){
		this.sectionID = id;
		this.sectionYear = year;
		this.sectionCompDate = completionDate;
		this.sectionOfferDate = offeringDate;
		this.sectionFormat = format;
		this.sectionPrice = price;
		this.taught_skills = new HashMap<Integer, Skill>();
	}

	public int getSectionID(){
		return this.sectionID;
	}

	public int getSectionYear(){
		return this.sectionYear;
	}

	public Date getSectionCompDate(){
		return this.sectionCompDate;
	}

	public Date getSectionOfferDate(){
		return this.sectionOfferDate;
	}

	public int getSectionFormat(){
		return this.sectionFormat;
	}

	public int getSectionPrice(){
		return this.sectionPrice;
	}

	public void setSectionID(int id){
		this.sectionID = id;
	}

	public void setSectionYear(int year){
		this.sectionYear = year;
	}

	public void setSectionCompDate(Date compDate){
		this.sectionCompDate = compDate;
	}

	public void setSectionOfferDate(Date offerDate){
		this.sectionOfferDate = offerDate;
	}

	public void setSectionFormat(int format){
		this.sectionFormat = format;
	}

	public void setSectionPrice(int price){
		this.sectionPrice = price;
	}

	
	public HashMap<Integer, Skill> getTaught_skills() {
		return taught_skills;
	}

	public void addSkill(Skill skill) {
		this.taught_skills.put(skill.getSkill_id(), skill);
	}

	@Override
	public boolean fetch(Connection con){
		try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM Section");
			boolean flag = false;
			while(rs.next()){
				flag = true;
				int s_id = rs.getInt("section_id");
				int s_year = rs.getInt("sec_year");
				Date s_compDate = rs.getDate("completion_date");
				Date s_offerDate = rs.getDate("offering_date");
				int s_format = rs.getInt("sec_format");
				int s_price = rs.getInt("price");
				Section Section = new Section(s_id, s_year,s_compDate,s_offerDate,s_format,s_price);
				super.rows.put(s_id,Section);
			}
			return flag;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean insert(Connection con){
		return false;
	}

	@Override
	public boolean delete(Connection con){
		return false;
	}

}