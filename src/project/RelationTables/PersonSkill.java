package project.RelationTables;

import java.sql.Connection;
import java.util.Map;

import project.RelationTable;
import project.Table;
import project.Tables.Person;
import project.Tables.Skill;

public class PersonSkill extends RelationTable {

    public PersonSkill(Map<Integer, Object> personList, Map<Integer, Object> skillList, String rTable, Connection con) {
        super(personList, skillList, rTable, con);
    }

    @Override
    public void updateDetails() {
        for(int i = 0; i < super.rows.size(); i++) {
            Table[] pair = super.rows.get(i);
            Person person = (Person) pair[0];
            Skill skill = (Skill) pair[1];
            person.addSkill(skill.getSkill_id(), skill);
        }
    }
    
}
