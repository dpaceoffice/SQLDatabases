package project.RelationTables;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import project.RelationTable;
import project.Table;
import project.Helpers.Duration;
import project.Tables.Job;
import project.Tables.Person;

public class PersonJobs extends RelationTable {

    private HashMap<Integer, Duration> timeMap = new HashMap<Integer, Duration>();

    public PersonJobs(Map<Integer, Object> tableX, Map<Integer, Object> tableY, String rTable, Connection con) {
        super(tableX, tableY, rTable, con);
    }

    @Override
    public boolean fetch(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM "+super.rTable);
            int index = 0;
            timeMap = new HashMap<Integer, Duration>();
            while (rs.next()) {
                int x = rs.getInt(1);
                int y = rs.getInt(2);
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                super.x = (Table) tableX.get(x);
                super.y = (Table) tableY.get(y);
                super.tables = new Table[2];
                super.tables[0] = super.x;
                super.tables[1] = super.y;
                rows.put(index, tables);
                timeMap.put(index, new Duration(startDate, endDate));
                index ++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public void updateDetails() {
        for(int i = 0; i < super.rows.size(); i++) {
            Table[] pair = super.rows.get(i);
            Duration time = timeMap.get(i);
            Person person = (Person) pair[0];
            Job job = (Job) pair[1];
            person.addJob(job.getJob_id(), job, time);
        }
    }

}
