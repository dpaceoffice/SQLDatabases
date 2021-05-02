package Tables;

public class Skill {
    private int skill_id;
    private String title;
    private String description;
    private int level;

    public Skill(int skill_id, String title, String description, int level) {
        this.skill_id = skill_id;
        this.title = title;
        this.description = description;
        this.level = level;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

}
