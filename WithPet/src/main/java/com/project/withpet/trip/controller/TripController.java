package com.project.withpet.trip.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.Session;
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
import com.project.withpet.trip.model.vo.TaxiReservation;
import com.project.withpet.trip.model.vo.Transportation;

@Controller
public class TripController {
	
	@Autowired
	private TripService tripService;
	
	
	@RequestMapping("placeList")
	public String placeList(HttpSession session) {
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
		//count 수 먼저 증가 
		

			int result1 = 0;
			int result2 = 0;
			int result5 = 0;
	
			R_MyPlace rMyPlace = new R_MyPlace();
			
			rMyPlace.setCourseSe(myCourse.getCourseSe());
			rMyPlace.setMemId(myCourse.getMemId());
			
			rMyPlace.setPlaceNo(myCourse.getPlaceNo1());
			
			if(tripService.increaseCount(myCourse.getPlaceNo1())>0) {
				result1 = tripService.saveMyCourse(rMyPlace);
			}
			
			if(tripService.increaseCount(myCourse.getPlaceNo2())>0) {
				rMyPlace.setPlaceNo(myCourse.getPlaceNo2());
				result2 = tripService.saveMyCourse(rMyPlace);
			}
			
			if(tripService.increaseCount(myCourse.getPlaceNo5())>0) {				
				rMyPlace.setPlaceNo(myCourse.getPlaceNo5());
				result5 = tripService.saveMyCourse(rMyPlace);
			}
			
			int result3 = 1;
			int result4 = 1;
			
			if(!myCourse.getPlaceNo3().equals("") && !myCourse.getPlaceNo4().equals("")) {
				
				if(tripService.increaseCount(myCourse.getPlaceNo3())>0) {
					rMyPlace.setPlaceNo(myCourse.getPlaceNo3());
					result3 = tripService.saveMyCourse(rMyPlace);
				}
				
				if(tripService.increaseCount(myCourse.getPlaceNo4())>0) {
					rMyPlace.setPlaceNo(myCourse.getPlaceNo4());
					result4 = tripService.saveMyCourse(rMyPlace);
				}
				
			} else if(myCourse.getPlaceNo3().equals("") && !myCourse.getPlaceNo4().equals("")) {
				
				if(tripService.increaseCount(myCourse.getPlaceNo4())>0) {
					rMyPlace.setPlaceNo(myCourse.getPlaceNo4());
					result4 = tripService.saveMyCourse(rMyPlace);
				}
				
			} else if(myCourse.getPlaceNo4().equals("") && !myCourse.getPlaceNo3().equals("")) {
				
				if(tripService.increaseCount(myCourse.getPlaceNo3())>0) {
					rMyPlace.setPlaceNo(myCourse.getPlaceNo3());
					result3 = tripService.saveMyCourse(rMyPlace);
				}
			}
			
			if(result1 * result2 * result3 * result4 * result5 != 0) {
				return "F";
			} else {
				return "S";
			}
	}
	
	@ResponseBody
	@RequestMapping(value="detail.place",produces="application/json; charset=UTF-8")
	public String detailPlace(int placeNo) {
		return new Gson().toJson(tripService.detailPlace(placeNo));
	}
	
	@RequestMapping("transReservation")
	public String transReservation() {
		return "trip/taxiReservation2";
	}
	
	@ResponseBody
	@RequestMapping("checkTReservation")
	public String checkTReservation(TaxiReservation r){

		Transportation t = new Transportation();
		t.setTrType2(r.getTrType2());
		t.setTrType("T");
		
		String taxiRDate2 = r.getTaxiRDate().substring(0,3);
		String taxiRDate3 = r.getTaxiRDate().substring(3,6);
		String taxiRDate4 = taxiRDate3+taxiRDate2 + "23";
		r.setTaxiRDate(taxiRDate4);
		//System.out.println(r);
		int result1 = tripService.checkTransportation(t);
		
		int result2 = tripService.checkTReservation(r);
		
		//System.out.println(result1);
		//System.out.println(result2);
		if(result1 == result2) {
			return "No";
		} else {
			return "Yes";
		}
	}
	
	@RequestMapping("taxiReservation")
	public String taxiReservation(TaxiReservation r, HttpSession session) {
		
		String taxiRDate2 = r.getTaxiRDate().substring(0,3);
		String taxiRDate3 = r.getTaxiRDate().substring(3,6);
		String taxiRDate4 = taxiRDate3+taxiRDate2 + "23";
		r.setTaxiRDate(taxiRDate4);
		r.setTrNo(tripService.findTaxiNo(r));
		
		System.out.println(r);
		if(tripService.taxiReservation(r)>0) {
			session.setAttribute("alertMsg","택시 예약에 성공했습니다.");
			return "redirect:transReservation";
		} else {
			session.setAttribute("alertMsg","택시 예약에 실패했습니다. 다시 시도해주세요");
			return "redirect:transReservation";
		}
	}
	
}

