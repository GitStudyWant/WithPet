package com.project.withpet.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.withpet.admin.model.service.AdminService;
import com.project.withpet.trip.model.vo.Transportation;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("adminPage")
	public String adminPage() {
		return "admin/adminMyPageMain";
	}
	
	@RequestMapping("adminTransportation")
	public String adminTransportation(Model m) {
		
		ArrayList<Transportation> list = adminService.adminTransportation();
		//System.out.println(list);
		m.addAttribute("trList", list);
		return "admin/adminTransportation";
	}
	
	@RequestMapping("goAddTr")
	public String addTransportation(Transportation t, HttpSession session) {
		//System.out.println(t.getTrFee());
		
		if(adminService.addTransportation(t)>0) {
			session.setAttribute("alertMsg","추가에 성공했습니다.");
			return "redirect:adminTransportation";
		} else {
			session.setAttribute("alertMsg","추가에 실패했습니다.");
			return "redirect:adminTransportation";
		}

	}
	
	@ResponseBody
	@RequestMapping("deleteTr")
	public String deleteTr(int trNo) {
		System.out.println(trNo);
		if(adminService.deleteTr(trNo) > 0) {
			System.out.println("0보다 크다" +adminService.deleteTr(trNo));
			return "Y";
		}else {
			System.out.println("아님.." +adminService.deleteTr(trNo));
			return "N";
		}
	}

}
