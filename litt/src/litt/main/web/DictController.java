package litt.main.web;

import java.util.List;
import litt.main.model.Dict;
import litt.main.service.IDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/dict") 
public class DictController {

	
	@Autowired
	private IDictService dictService;
	
	@RequestMapping("/getProvince") 
	private List<Dict> getProvince(String parentCode){
		return dictService.getDictListByConditions(parentCode);
	}
}
