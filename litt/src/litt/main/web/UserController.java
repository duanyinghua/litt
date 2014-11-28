package litt.main.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import litt.main.model.User;
import litt.main.pojo.LittStatus;
import litt.main.service.ICommonService;
import litt.main.service.IUserService;
import litt.main.tool.LittCondition;
import litt.main.tool.LittPagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 
@RequestMapping("/main/user") 
public class UserController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private ICommonService commonService;
	
	@RequestMapping("/queryById")  
	@ResponseBody
	public User queryUserById(String id){
		return userService.queryById(id);
	}
	
	@RequestMapping("/listAll")  
	@ResponseBody
	public Map<String, Object> listUserAll(int rows, int page, Date startDate, Date endDate, String userName){
		Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map
		LittCondition conditions = new LittCondition();
		conditions.setStartDate(startDate);
		conditions.setEndDate(endDate);
		List<User> userList = userService.listUserByConditions(new LittCondition(), new LittPagination(page, rows));
		jsonMap.put("rows", userList);
		jsonMap.put("total", userService.countUserByConditions(new LittCondition()));
		return jsonMap;
	}
	
	@RequestMapping("/validAttr")  
	@ResponseBody
	public Boolean validAttr(String attrContent, String attrName){
		return commonService.validAnyAttr(attrContent, attrName, User.class);
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public LittStatus saveUser(@RequestBody User user){
		LittStatus status = new LittStatus();
//		if(data == "" || data == null){
//			status.setStatus("0");
//			status.setComment("保存失败, 请检查网络连接!");
//			return status;
//		}
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.configure(Feature.ALLOW_SINGLE_QUOTES, true);
//		DeRoute route = new DeRoute();
//		try {
//			route = mapper.readValue(data, DeRoute.class);
//		} catch (Exception e){
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			status.setStatus("0");
//			status.setComment("保存路由失败");
//			return status;
//		}
//		route.setCreateTime(new Date());
//		routeService.insert(route);
		status.setStatus("1");
		status.setComment("保存成功");
		return status;
		
	}
	
	@RequestMapping("/test")  
	@ResponseBody
	public LittCondition testJson(){
		LittCondition con = new LittCondition();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userName", "123");
		map.put("abc", "121d2d12e45&*(");
		con.setMap(map);
		con.setStartDate(new Date());
		con.setEndDate(new Date());
		con.setDateProp("birthday");
		return con;
	}

}
