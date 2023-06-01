package com.project.withpet.trip.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.withpet.trip.model.service.TripService;
import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.R_MyPlace;

@Controller
public class TripController {
	
	@Autowired
	private TripService tripService;
	
	
	@RequestMapping("placeList")
	public String placeList() {
		return "trip/myplace";		
	}
	
	
	@ResponseBody
	@RequestMapping(value="placeAllList", produces="application/json; charset=UTF-8")
	public String placeAllList(Place p) {
		return new Gson().toJson(tripService.selectPlaceList(p));	
	}
	
	@ResponseBody
	@RequestMapping(value="placeBestList", produces="application/json; charset=UTF-8")
	public String placeBestList(Place p) {
		return new Gson().toJson(tripService.bestPlaceList(p));
	}
	
	@RequestMapping("insertPlace")
	public String insertPlace(Place p,
			                   MultipartFile upfile,
			                   HttpSession session) {
		 
		if(!upfile.getOriginalFilename().equals("")) {
			System.out.println(saveFile(upfile, session));
			p.setPlaceOriginName(upfile.getOriginalFilename());
			p.setPlaceChangeName("resources/uploadFiles/place/" + saveFile(upfile, session));
		}
		if(tripService.insertPlace(p)>0) {
			session.setAttribute("alertMsg","장소 추가에 성공했습니다.");
			return "redirect:placeList";
		} else {
			session.setAttribute("alertMsg","장소 추가에 실패했습니다.");
			return "redirect:placeList";
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
	
	
	@ResponseBody
	@RequestMapping("checkMyCourse")
	public int checkMyCourse(String memId) {
		System.out.println(memId);
		return tripService.checkMyCourse(memId);
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("saveMyCourse")
	public String saveMyCourse(MyPlace myCourse, HttpSession session) {
		   			
			R_MyPlace rMyPlace = new R_MyPlace();
			
			rMyPlace.setCourseSe(myCourse.getCourseSe());
			rMyPlace.setMemId(myCourse.getMemId());
			
			rMyPlace.setPlaceNo(myCourse.getPlaceNo1());	
			int result1 = tripService.saveMyCourse(rMyPlace);
			
			rMyPlace.setPlaceNo(myCourse.getPlaceNo2());
			int result2 = tripService.saveMyCourse(rMyPlace);
			
			rMyPlace.setPlaceNo(myCourse.getPlaceNo5());
			int result5 = tripService.saveMyCourse(rMyPlace);
			
			int result3 = 1;
			int result4 = 1;
			
			if(!myCourse.getPlaceNo3().equals("") && !myCourse.getPlaceNo4().equals("")) {
				
				rMyPlace.setPlaceNo(myCourse.getPlaceNo3());
				result3 = tripService.saveMyCourse(rMyPlace);
				
				rMyPlace.setPlaceNo(myCourse.getPlaceNo4());
				result4 = tripService.saveMyCourse(rMyPlace);
				
			} else if(myCourse.getPlaceNo3().equals("") && !myCourse.getPlaceNo4().equals("")) {
				
				rMyPlace.setPlaceNo(myCourse.getPlaceNo4());
				result4 = tripService.saveMyCourse(rMyPlace);
				
			} else if(myCourse.getPlaceNo4().equals("") && !myCourse.getPlaceNo3().equals("")) {

				rMyPlace.setPlaceNo(myCourse.getPlaceNo3());
				result3 = tripService.saveMyCourse(rMyPlace);
			}
			
			
			if(result1 * result2 * result3 * result4 * result5 != 0) {
				return "F";
			} else {
				return "S";
			}

	}
	
}

