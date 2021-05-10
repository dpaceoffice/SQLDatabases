
import java.util.Map.Entry;
import java.util.ArrayList;
import java.util.Scanner;

import project.Database;
import project.Tables.Course;
import project.Tables.Person;
import project.Tables.Section;
import project.Tables.Skill;

public class CLI {

	private static int workerId;
	private static int courseId;
	private static Database db = null;

	static String[] prompt = { "Hello! Please provide a worker's ID to get started",
			"What course IDs are on the workers's transcript?" };

	public static void main(String args[]) {
		db = Database.getInstance();
		if (db.init()) {
			Scanner scan = new Scanner(System.in);
			System.out.println(prompt[0]);
			if (scan.hasNextInt())
				workerId = scan.nextInt();
			System.out.println(prompt[1]);
			if (scan.hasNextInt())
				courseId = scan.nextInt();
			crossExam();
			scan.close();
		}
	}

	private static void crossExam() {
		Person worker = (Person) db.getLoaded_persons().get(workerId);
		if(worker == null) {
			System.out.println("Invalid Worker ID");
			return;
		}
		ArrayList<Skill> array = new  ArrayList<Skill>();
		System.out.println("Self proclaimed skills:");
		for(Entry<Integer, Skill> set : worker.get_skills().entrySet()) {
			Skill skill = set.getValue();
			array.add(skill);
			System.out.println(skill.getSkill_id() + " " + skill.getTitle());
		}

		Course course = (Course) db.getLoaded_courses().get(courseId);
		if(course == null) {
			System.out.println("Invalid Course ID");
			return;
		}
		ArrayList<Skill> array2 = new  ArrayList<Skill>();
		System.out.println("Transcript skills:");
		for(Entry<Integer, Section> set : course.getSections().entrySet()) {
			Section section = set.getValue();
			for(Entry<Integer, Skill> set2 : section.getTaught_skills().entrySet()) {
				Skill skill = set2.getValue();
				array2.add(skill);
				System.out.println(""+skill.getSkill_id()+" "+skill.getTitle());
			}
		}
		compare(array, array2);
	}

	private static void compare(ArrayList<Skill> array, ArrayList<Skill> array2) {
		int count = 0;
		for(int i = 0; i < array.size(); i ++) {
			int skill_id1 = array.get(i).getSkill_id();
			for(int j = 0; j < array2.size(); j++) {
				int skill_id2 = array2.get(j).getSkill_id();
				if(skill_id1 == skill_id2) {
					count ++;
					System.out.println("\nDuplicate Skill ID: "+skill_id1);
				}
			}
		}
		System.out.println(count+" transcript backed skills.");
	}

}
