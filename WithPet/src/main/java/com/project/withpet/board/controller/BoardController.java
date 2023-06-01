package com.project.withpet.board.controller;

import java.io.File;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.withpet.board.model.service.BoardService;
import com.project.withpet.board.model.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	
	@RequestMapping("list.review")
	public String selectReList() {
		
		

		return "board/ReviewBoard";
	}
	
	@RequestMapping("list.free")
	public String selectFrList() {
		
		
		
		return "board/FreeBoard";
	}
	
	@RequestMapping("list.qna")
	public String selectQnList() {
		
		
		
		return "board/QnaBoard";
	}
	
	@RequestMapping("list.creator")
	public String selectCreatorList() {
		
		
		
		return "board/Creator";
	}
	
	@RequestMapping("list.share")
	public String selectShareList() {
		
		
		
		return "board/Share";
	}
	
	@RequestMapping("list.notice")
	public String selectNoticeList() {
		
		
		
		return "board/Notice";
	}
}
