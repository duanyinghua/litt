package litt.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import litt.main.dao.BaseDao;
import litt.main.model.Dict;
import litt.main.service.IDictService;
import litt.main.tool.LittCondition;
import litt.main.tool.LittPagination;

@Service
public class DictServiceImpl implements IDictService {
	
	@Autowired
    private BaseDao baseDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Dict> getDictListByConditions(String parentCode) {
		// TODO Auto-generated method stub
		LittCondition conditions = new LittCondition();
		if(parentCode != null && !parentCode.equals("")){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("parentCode", parentCode);
			conditions.setMap(map);
		}
		return (List<Dict>) baseDao.queryByConditions(Dict.class, conditions, new LittPagination());
	}

}
