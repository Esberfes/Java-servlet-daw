package app;

public class User implements Comparable<User>{
	public String email;
	public String password;
	
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
	public String serialize() {
		return "email:" + this.email + "#" + "password:" + this.password;
	}

	@Override
	public int compareTo(User o) {
		if(o.email.equals(this.email) && o.password.equals(this.password)) return 1;
		return 0;
	}
	
	public static User deserialize(String obj) {
		String[] parts = obj.split("#");
		if(parts.length != 2) return null;
		String email = parts[0].split("email:")[1];
		String password = parts[1].split("password:")[1];
		return new User(email, password);
	}
}
