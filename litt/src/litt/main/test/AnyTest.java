package litt.main.test;

public class AnyTest {
	
	public static void main(String[] args){
		try {
			Class c = Class.forName("litt.main.model.User");
			System.out.println(c.getName());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
