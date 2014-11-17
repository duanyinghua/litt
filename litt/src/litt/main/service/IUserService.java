package litt.main.service;

import java.util.List;

import litt.main.model.User;
import litt.main.tool.LittCondition;
import litt.main.tool.LittPagination;

public interface IUserService {
	
	public User queryById(String id);
	
	public String saveUser(User user) throws Exception;
	
	public Long countUserByConditions(LittCondition conditions);
	
	public List<User> listUserByConditions(LittCondition conditions, LittPagination pagination);

}
