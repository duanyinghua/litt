package litt.main.web;

import litt.main.service.ICommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/common") 
public class CommonController {
	
	@Autowired
	private ICommonService commonService;
}
