package litt.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import litt.main.model.User;
import litt.main.pojo.LittCondition;
import litt.main.pojo.LittPagination;
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
	public Map<String, Object> listUserAll(int rows, int page){
		Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map 
		LittCondition conditions = new LittCondition();
		LittPagination pagination = new LittPagination(page, rows);
		List<User> userList = userService.listUserByConditions(conditions, pagination);
		jsonMap.put("rows", userList);
		jsonMap.put("total", userService.countUserByConditions(conditions));
		return jsonMap;
	}

}
