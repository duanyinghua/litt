package litt.main.web;

import java.util.List;

import litt.main.model.User;
import litt.main.pojo.LittCondition;
import litt.main.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 
@RequestMapping("/main/user") 
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/queryById")  
	@ResponseBody
	public User queryUserById(String id){
		return userService.queryById(id);
	}
	
	@RequestMapping("/listAll")  
	@ResponseBody
	public List<User> listUserAll(){
		LittCondition conditions = new LittCondition();
		return userService.listUserByConditions(conditions);
	}

}
