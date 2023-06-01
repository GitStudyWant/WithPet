package com.project.withpet.trip.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.withpet.trip.model.service.TripService;
import com.project.withpet.trip.model.vo.Place;

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
			                   HttpSession session,
			                   Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			saveFile(upfile, session);
			p.setPlaceOriginName(upfile.getOriginalFilename());
			p.setPlaceChangeName("resources/uploadFiles/place/" + saveFile(upfile, session));
		}
		
		if(tripService.insertPlace(p)>0) {
			return "s";
		} else {
			return "f";
		}
	}
	
	
	public String saveFile(MultipartFile upfile, 
 			 HttpSession session) {


	String originName = upfile.getOriginalFilename();
	String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	int ranNum = (int)(Math.random() * 90000 + 10000);
	String ext = originName.substring(originName.lastIndexOf("."));
	String changeName = currentTime + ranNum + ext;
	String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
	
	try {
		upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
		e.printStackTrace();
		}
	
	return changeName;
	
	}
}

