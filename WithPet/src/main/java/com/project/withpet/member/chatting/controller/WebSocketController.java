package com.project.withpet.member.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketController {

	@RequestMapping("/basic")
	public String basic() {
		return "basic";
	}
	
	@RequestMapping("/group")
	public String group() {
		return "group";
	}
	
	
}
