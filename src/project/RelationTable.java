package project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public abstract class RelationTable {
    protected Table x;
    protected Table y;
    protected String rTable;
    protected Map<Integer, Object> tableX; 
    protected Map<Integer, Object> tableY;
    protected Table[] tables;
    public HashMap<Integer, Table[]> rows;

    public RelationTable(Map<Integer, Object> tableX, Map<Integer, Object> tableY, String rTable, Connection con) {
        this.tableX = tableX;
        this.tableY = tableY;
        this.rTable = rTable;
        this.rows = new HashMap<Integer, Table[]>();
        fetch(con);
        updateDetails();
    }

    public boolean fetch(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM "+this.rTable);
            int index = 0;
            while (rs.next()) {
                int x = rs.getInt(1);
                int y = rs.getInt(2);
                this.x = (Table) tableX.get(x);
                this.y = (Table) tableY.get(y);
                tables = new Table[2];
                tables[0] = this.x;
                tables[1] = this.y;
                rows.put(index, tables);
                index ++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public abstract void updateDetails();

}
