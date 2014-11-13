package litt.main.web;

import litt.main.model.User;
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
	
	@RequestMapping("/detail")  
	@ResponseBody
	public User detailUserById(String id){
		return userService.queryById(id);
	}

}
