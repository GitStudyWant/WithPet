package com.project.withpet.cafe.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.withpet.cafe.model.service.CafeService;
import com.project.withpet.cafe.model.vo.Cafe;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.common.model.vo.PageInfo;
import com.project.withpet.common.template.Pagination;

@Controller
public class CafeController {

	@Autowired
	private CafeService cafeService;
	
	@RequestMapping("cafe.bo")
	public String selectList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
							 Model model, HttpSession session) {
		PageInfo pi = Pagination.getPageInfo(cafeService.selectListCount(), currentPage, 30, 10);

		model.addAttribute("pi", pi);
		session.setAttribute("list", cafeService.selectList(pi));
		
		System.out.println(cafeService.selectList(pi));
		
		return "cafe/cafeListView";
	}
	
	@RequestMapping("cafeEnrollForm.bo")
	public String cafeEnrollForm() {
		return "cafe/cafeEnrollForm";
	}
	
	
	@RequestMapping("cafeInsert.bo")
	public String insertCafe(Cafe c,
			                 MultipartFile upfile,
			                 HttpSession session,
			                 Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			c.setOriginName(upfile.getOriginalFilename());
			c.setChangeName("resources/cafe_upfiles/" + saveFile(upfile, session));
		}
		System.out.println(c);
		if(cafeService.insertCafe(c) > 0) {
			session.setAttribute("alertMsg", "카페 등록 완료");
			return "redirect:cafe.bo";
		} else {
			model.addAttribute("errorMsg", "오류 발생");
			return "common/errorPage";
		}
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int)(Math.random() * 90000 + 10000);
			
		String ext = originName.substring(originName.lastIndexOf("."));
			
		String changeName = currentTime + ranNum + ext;
			
		String savePath = session.getServletContext().getRealPath("/resources/cafe_upfiles/");
				
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
			
		return changeName;
}
	
	
	@RequestMapping("map.do")
	public String map(String cafeAddress, String cafeTitle, Model m) {
		m.addAttribute("cafeAddress", cafeAddress );
		m.addAttribute("cafeTitle", cafeTitle );
		System.out.println(cafeTitle);
		return "cafe/map";
	}
	
	@RequestMapping("info.do")
	public ModelAndView cafeInfo(ModelAndView mv,
		                         int cno,
		                         HttpSession session) {
		
		if(cafeService.cafeInfo(cno) != null) {
			mv.addObject("c", cafeService.cafeInfo(cno));
			mv.setViewName("cafe/cafeInformation");
		}
		return mv;
	}
	
	@RequestMapping("res.me") // 예약 임시
	public ModelAndView res(int cno, 
					 // Model m,
					  ModelAndView mv,
					  HttpSession session) {
		mv.addObject("c", cafeService.cafeInfo(cno));
		mv.setViewName("cafe/res");
		//m.addAttribute("Cafe", c );
		//return "cafe/res";
		return mv;
	}	
	
	@RequestMapping("cafeReservation")
	public String cafeReservation(CafeRes r, HttpSession session) {
		
		String resDate2 = r.getResDate().substring(0,3);
		String resDate3 = r.getResDate().substring(3,6);
		String resDate4 = resDate3+resDate2 + "23";
		
		r.setResDate(resDate4);
		r.setCafeNo(cafeService.findCafeNo(r));
		
		System.out.println(resDate4);
		System.out.println(r);
		
		
		if(cafeService.cafeReservation(r)>0) {
			session.setAttribute("alertMsg", "카페 예약 완료");
			return "redirect:cafe.bo";
		} else {
			session.setAttribute("alertMsg", "카페 예약 실패");
			return "redirect:cafeReservation";
		}
		
	}
	
	@RequestMapping("aroundSearch")
	public String aroundSearch() {
		return "cafe/aroundHospital";
	}
	
	
	
	
	
	
	
	
	
	
}
