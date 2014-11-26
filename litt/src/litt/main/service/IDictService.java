package litt.main.service;

import java.util.List;
import litt.main.model.Dict;

public interface IDictService {
	
	public List<Dict> getDictListByConditions(String parentCode);

}
