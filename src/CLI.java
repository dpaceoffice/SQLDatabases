
import java.util.Map.Entry;
import java.util.Scanner;

import project.Database;
import project.Tables.Person;
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
		System.out.println("Self proclaimed skills:");
		for(Entry<Integer, Skill> set : worker.get_skills().entrySet()) {
			Skill skill = set.getValue();
			System.out.println(skill.getSkill_id() + " " + skill.getTitle());
		}

	}

}
