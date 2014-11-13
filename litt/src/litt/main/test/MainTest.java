package litt.main.test;

import static org.junit.Assert.*;
import java.util.HashMap;
import java.util.Map;
import litt.main.model.User;
import litt.main.pojo.LittCondition;
import litt.main.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:appContext.xml")
public class MainTest{
	
	@Autowired
	IUserService userService;
	
	@Test
	public void testQueryUserById(){
	  User u = userService.queryById("123");
      assertNotNull(u);  
    }  
	
	@Test
	public void testSaveUser(){
		User u = new User();
		u.setLoginName("testadd");
		u.setPassword("123");
		try {
			assertNotNull(userService.saveUser(u));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			assertNotNull(null);
		}
	}
	
	@Test
	public void testCountUserByConditions(){
		LittCondition conditions = new LittCondition();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginName", "testadd");
		conditions.setMap(map);
		Long count = userService.countUserByConditions(conditions);
		assertTrue(count > 0);
	}

}
