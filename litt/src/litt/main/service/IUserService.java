package litt.main.service;

import litt.main.model.User;
import litt.main.pojo.LittCondition;

public interface IUserService {
	
	public User queryById(String id);
	
	public String saveUser(User user) throws Exception;
	
	public Long countUserByConditions(LittCondition conditions);

}
