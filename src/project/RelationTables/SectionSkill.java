package project.RelationTables;

import java.sql.Connection;
import java.util.Map;

import project.RelationTable;
import project.Table;
import project.Tables.Section;
import project.Tables.Skill;

public class SectionSkill extends RelationTable {

    public SectionSkill(Map<Integer, Object> sectionList, Map<Integer, Object> skillList, String rTable, Connection con) {
        super(sectionList, skillList, rTable, con);
    }

    @Override
    public void updateDetails() {
        for(int i = 0; i < super.rows.size(); i++) {
            Table[] pair = super.rows.get(i);
            Section section = (Section) pair[0];
            Skill skill = (Skill) pair[1];
            section.addSkill(skill);
        }
    }
    
}
