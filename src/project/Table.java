package project;

import java.sql.Connection;
import java.util.HashMap;

public abstract class Table {

    public HashMap<Integer, Object> rows;

    public abstract boolean fetch(Connection con);


    public abstract boolean delete(Connection con);

}
