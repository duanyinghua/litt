package litt.main.web;

import java.util.List;
import litt.main.model.Role;
import litt.main.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 
@RequestMapping("/main/role") 
public class RoleController {
	
	@Autowired
	private IRoleService roleService;
	
	@RequestMapping("/listAll")  
	@ResponseBody
	public List<Role> listRoleAll(){
		return roleService.listRolesAll();
	}

}
