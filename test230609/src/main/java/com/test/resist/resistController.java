package com.test.resist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class resistController {
	
	@RequestMapping("/move")
	public String move() {
		System.out.println("sdfas");
		return "result";		
	}

}
