package litt.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import litt.main.dao.BaseDao;
import litt.main.model.Role;
import litt.main.service.IRoleService;
import litt.main.tool.LittCondition;
import litt.main.tool.LittPagination;

@Service
public class RoleServiceImpl implements IRoleService {
	
	@Autowired
    private BaseDao baseDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> listRolesAll() {
		// TODO Auto-generated method stub
		LittCondition conditions = new LittCondition();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isValid", 1);
		conditions.setMap(map);
		return (List<Role>) baseDao.queryByConditions(Role.class, conditions, new LittPagination());
	}

}
