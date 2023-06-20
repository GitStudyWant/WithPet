package com.test.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("/orderProduct.do")
	public String order(String name, int blackPen, int redPen, int bluePen, int white, Model model) {
		
		int Price1 = blackPen * 500;
		int Price2 = redPen * 700;
		int Price3 = bluePen * 700;
		int Price4 = white * 1000;
		
		int total =  Price1 + Price2 + Price3 + Price4;
		
		if (total == 0) {
			return "redirect:/error.do";
		}
		
		int[] Count = {blackPen, redPen, bluePen, white};
		int[] Price = {Price1, Price2, Price3, Price4};
		
		model.addAttribute("name", name);
		model.addAttribute("Count", Count);
		model.addAttribute("Price", Price);
		model.addAttribute("total", total);		
		
		return "/resultPage.html";
		
	}
	
	@RequestMapping("error.do")
	public String error() {
		return "/errorPage.html";
	}
		
}
