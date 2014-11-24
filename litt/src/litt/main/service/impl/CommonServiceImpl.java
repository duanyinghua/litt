package litt.main.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import litt.main.dao.BaseDao;
import litt.main.service.ICommonService;

@Service
public class CommonServiceImpl implements ICommonService {
	
	@Autowired
    private BaseDao baseDao;

	@Override
	public boolean validAnyAttr(String attrContent, String attrName,
			Class<?> className) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put(attrName, attrContent);
		return baseDao.validObject(className, map);
	}

}
