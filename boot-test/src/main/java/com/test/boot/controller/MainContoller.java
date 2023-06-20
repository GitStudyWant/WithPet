package com.test.boot.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.boot.BootTestApplication;

@Controller
public class MainContoller {
	
	public static void main(String[] args) {
		SpringApplication.run(BootTestApplication.class, args);
	}
	
	@RequestMapping("/")
	public String main() {
		return "/mainPage.html";
	}

}
