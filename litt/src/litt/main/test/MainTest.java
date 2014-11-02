package litt.main.test;

import static org.junit.Assert.*;
import litt.main.model.User;
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

}
