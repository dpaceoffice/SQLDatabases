package project.Tables;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import project.Table;

public class Factory extends Table{
    
    private int factoryID;
    private String factoryName;
    private String factoryAddress;
    private int factoryZipcode;
    private String factoryManager;
    
    public Factory (Connection connection){
	super.rows = new HashMap<Integer, Object>();
	fetch(connection);
    }
    
    private Factory(int id, String name, String address, int zipcode, String manager){
        this.factoryID = id;
        this.factoryName = name;
        this.factoryAddress = address;
        this.factoryZipcode = zipcode;
        this.factoryManager = manager;
    }
    
    public int getFactoryID(){
        return this.factoryID;
    }
    public String getFactoryName(){
        return this.factoryName;
    }
    
    public String getFactoryAddress(){
        return this.factoryAddress;
    }
    
    public int getFactoryZipcode(){
        return this.factoryZipcode;
    }
    
    public String getFactoryManager(){
        return this.factoryManager;
    }
    
    public void setFactoryID(int id){
        this.factoryID = id;
    }
    public void setFactoryName(String name){
        this.factoryName = name;
    }
    
    public void setFactoryAddress(String address){
        this.factoryAddress = address;
    }
    
    public void setFactoryZipcode(int zipcode){
        this.factoryZipcode = zipcode;
    }
    
    public void setFactoryManager(String manager){
        this.factoryManager = manager;
    }
    
    @Override
	public boolean fetch(Connection con){
            try{
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM factory");
		boolean flag = false;
		while(rs.next()) {
                    int f_id = rs.getInt("factoryid");
                    String f_name = rs.getString("factoryname");
                    String f_address = rs.getString("address");  
                    int f_zipcode = rs.getInt("zipcode");        
                    String f_manager = rs.getString("managername");       
                    Factory factory = new Factory(f_id, f_name, f_address, f_zipcode, f_manager);
                    super.rows.put(f_id, factory);
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
