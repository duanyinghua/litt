package litt.main.web;

import java.util.List;
import litt.main.model.Dict;
import litt.main.service.IDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 
@RequestMapping("/dict") 
public class DictController {

	
	@Autowired
	private IDictService dictService;
	
	@RequestMapping("/getProvince")
	@ResponseBody
	private List<Dict> getProvince(){
		return dictService.getDictListByConditions("area");
	}
	
	@RequestMapping("/getCity")
	@ResponseBody
	private List<Dict> getCity(String provinceCode){
		return dictService.getDictListByConditions(provinceCode);
	}
	
	@RequestMapping("/getDistrict")
	@ResponseBody
	private List<Dict> getDistrict(String cityCode){
		return dictService.getDictListByConditions(cityCode);
	}
}
