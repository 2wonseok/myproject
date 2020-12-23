package member.model;

public class User {
	private String id;
	private String name;
	private int manager;
	
	public User(String id, String name, int manager) {
		this.id = id; 
		this.name = name;
		this.manager = manager;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}
	
	
}
