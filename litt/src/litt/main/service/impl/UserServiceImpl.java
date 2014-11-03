package litt.main.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import litt.main.dao.BaseDao;
import litt.main.model.User;
import litt.main.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
    private BaseDao baseDao;

	@Override
	public User queryById(String id) {
		return (User)baseDao.load(User.class, id);
	}

}
