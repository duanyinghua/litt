package litt.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import litt.main.dao.BaseDao;
import litt.main.model.User;
import litt.main.service.IUserService;
import litt.main.tool.LittCondition;
import litt.main.tool.LittPagination;

@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
    private BaseDao baseDao;

	public User queryById(String id) {
		return (User)baseDao.load(User.class, id);
	}
	
	public String saveUser(User user) throws Exception{
		return baseDao.add(user);
	}
	
	public Long countUserByConditions(LittCondition conditions){	
		return baseDao.getTotalCount(User.class, conditions);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUserByConditions(LittCondition conditions, LittPagination pagination) {
		// TODO Auto-generated method stub
		return (List<User>) baseDao.queryByConditions(User.class, conditions, pagination);
	}
}
