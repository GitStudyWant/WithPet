package com.project.withpet.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripController {
	
	@RequestMapping("myplace")
	public String myplaceList() {
		
		
		return "trip/myplace";
	}

}
