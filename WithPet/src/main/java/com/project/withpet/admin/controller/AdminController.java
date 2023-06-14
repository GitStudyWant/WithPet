package com.project.withpet.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.withpet.admin.model.service.AdminService;
import com.project.withpet.admin.model.vo.Search;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.common.template.Pagination;
import com.project.withpet.cafe.model.vo.Cafe;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("adminPage")
	public String adminPage(HttpSession session) {
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertMsg","로그인 후 이용해주세요~");
			return "common/main";
		} else {
			return "admin/adminMyPageMain";
		}
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
	public String deleteTr(Transportation t) {
		int result = adminService.countTrRes(t);
		if(result == 0) {
			if(adminService.deleteTr(t.getTrNo()) > 0) {
				return "Y";
			}else {
				return "N";
			}
		} else {
			return "NN";
		}
	}
	
	@RequestMapping("transReservationList")
	public String taxiReservationList(Model m) {
		
		ArrayList<TaxiReservation> tList = adminService.taxiReservationList();
		m.addAttribute("tList", tList);
		
		return "admin/transReservationList";
	}
	
	@ResponseBody
	@RequestMapping(value="carReservationList",produces="application/json; charset=UTF-8")
	public String carReservationList() {
		return new Gson().toJson(adminService.carReservationList());
	}
	
	@ResponseBody
	@RequestMapping("deleteTReservation")
	public String deleteTReservation(String resNo, String trType) {
		int result = 0;
		
		if(trType.equals("T")) {
			result = adminService.deleteTReservation(resNo);
		} else {
			result= adminService.deleteCReservation(resNo);
		}
	
		if(result > 0) {
			return "Y";
		} else {
			return "N";
		}
	}
	
	@RequestMapping("adminPlaceList")
	public String placeList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model m) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.countPlaceList(), currentPage, 10, 5);
		
		ArrayList<Place> pList = adminService.adminPlaceList(pi);
		m.addAttribute("pi", pi);
		m.addAttribute("pList",pList);
		return "admin/adminPlaceList";
	}
	
	@ResponseBody
	@RequestMapping("deletePlace")
	public String deletePlace(int placeNo) {
		if(adminService.deletePlace(placeNo) > 0) {
			return "Y";
		} else {
			return "N";
		}
	}
	
	@RequestMapping("modifyPlace")
	public String modifyPlace(Place p, MultipartFile upfile, HttpSession session) {
		
		switch(p.getPlaceType()){
			case "식당/카페": p.setPlaceType("A"); break;
			case "숙박": p.setPlaceType("B"); break;
			default : p.setPlaceType("C");
		}
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			if(!p.getPlaceChangeName().equals("")) {
				new File(session.getServletContext().getRealPath(p.getPlaceChangeName())).delete();
				p.setPlaceOriginName(upfile.getOriginalFilename());
				p.setPlaceChangeName("resources/uploadFiles/places/" + saveFile(upfile, session));
			} else {
				p.setPlaceOriginName(upfile.getOriginalFilename());
				p.setPlaceChangeName("resources/uploadFiles/places/" + saveFile(upfile, session));
			}
			
		}
		
		System.out.println(p);
		
		if(adminService.modifyPlace(p) > 0) {
			session.setAttribute("alertMsg","수정에 성공했습니다.");
			return "redirect:adminPlaceList";
		} else {
			session.setAttribute("alertMsg","수정에 실패했습니다.");
			return "redirect:adminPlaceList";
		}
	}
	
	
	public String saveFile(MultipartFile upfile, 
			 HttpSession session) {
	
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = "WITHPET"+currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/places/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			}
		
		return changeName;
		
		}
	
	@RequestMapping("adminMemberList")
	public String adminMemberList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
								  Model model) {
		PageInfo pi = Pagination.getPageInfo(adminService.adminMemberListCount(), currentPage, 25, 10);
		ArrayList<Member> list  = adminService.adminMemberList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminMyPageMain";
	}
	
	@RequestMapping("adminGradeUpdate")
	public String adminGradeUpdate(Member m, HttpSession session) {
		
		if(adminService.adminGradeUpdate(m) > 0) {
			System.out.println(m);
			session.setAttribute("alertMsg","성공");
			return "redirect:adminMyPageMain";
		} else {
			session.setAttribute("alertMsg","실패");
			return "redirect:adminMyPageMain";
		}		
	}
	
	
	@RequestMapping(value="cafeResManagement",produces="application/json; charset=UTF-8")
	public String cafeResManagement(Model m) {
		ArrayList<CafeRes> cList = adminService.cafeResManagement();
		m.addAttribute("cList", cList);
		System.out.println(cList);
		return "admin/cafeResManagement";
	}	
	
	@ResponseBody
	@RequestMapping("deleteCr")
	public String deleteTr(int cafeResNo) {
		if(adminService.deleteCr(cafeResNo) > 0) {
			return "Y";
		}else {
			return "N";
		}
	} 
	
	@RequestMapping("cafeManagement")
	public String cafeManagement(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model m) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.managementCount(), currentPage, 10, 5);
		
		ArrayList<Cafe> cList = adminService.cafeManagement(pi);
		m.addAttribute("pi", pi);
		m.addAttribute("cList",cList);
		return "admin/cafeManagement";
	}	
	
	@ResponseBody
	@RequestMapping("deleteCafe")
	public String deleteCafe(int cafeNo) {
		if(adminService.deleteCafe(cafeNo) > 0) {
			return "Y";
		} else {
			return "N";
		}
	}	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="searchKeyword", produces="application/json; charset=UTF-8")
	public String searchKeyword(String key) {
		ArrayList<Search> keyList = adminService.searchKeyword(key);
		//System.out.println(keyList);
		return new Gson().toJson(keyList);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="bestKeyword", produces="application/json; charset=UTF-8")
	public String bestKeyword() {
		ArrayList<Search> bestList = adminService.bestKeyword();
		//System.out.println(bestList);
		return new Gson().toJson(bestList);
	}
	
	
	
}
