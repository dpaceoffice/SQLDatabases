package project.RelationTables;

import java.sql.Connection;
import java.util.Map;

import project.RelationTable;
import project.Table;
import project.Tables.Course;
import project.Tables.Section;

public class SectionCourse extends RelationTable {

    public SectionCourse(Map<Integer, Object> sectionList, Map<Integer, Object> courseList, String rTable, Connection con) {
        super(sectionList, courseList, rTable, con);
    }

    @Override
    public void updateDetails() {
        for(int i = 0; i < super.rows.size(); i++) {
            Table[] pair = super.rows.get(i);
            Section section = (Section) pair[0];
            Course course = (Course) pair[1];
           course.addSection(section);
        }
    }
    
}
