package com.project.withpet.board.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.common.template.Pagination;
import com.project.withpet.board.model.service.BoardService;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.BoardAttachment;
import com.project.withpet.board.model.vo.Comments;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("list.free")
	public String selectFrList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectFrListCount(), currentPage, 5, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectFrList(pi));
		return "board/FreeBoard";
	}
	
	@RequestMapping("list.review")
	public String selectReList() {
		return "board/ReviewBoard";
	}
	
	
	@RequestMapping("enrollForm.fr")
	public String enrollForm() {
		return "board/FreeBoardEnroll";
	}
	
	@RequestMapping("insert.free")
	public String insertFrBoard(Board b,
								MultipartFile upfile, // 여러개의 첨부파일을 전달받을시 MultipartFile[]로 받으면됨
								HttpSession session,
								Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/BoardFiles/Free" + saveFile(upfile, session));
		}

		
		if(boardService.insertFrBoard(b)>0) {
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:list.free";
		} else {
			model.addAttribute("errorMsg","게시글 작성 실패...");
			return "redirect:list.free";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
					String originName =upfile.getOriginalFilename();
					String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
					int ranNum = (int)(Math.random() * 90000+10000);
					String ext = originName.substring(originName.lastIndexOf("."));
					String changeName = "WITHPET"+currentTime + ranNum + ext;
					String savePath = session.getServletContext().getRealPath("resources/BoardFiles/Free");
					
					try {
						upfile.transferTo(new File(savePath+changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					return changeName;
	}		
	
	@RequestMapping("detail.fr")
	public ModelAndView selectBoard(ModelAndView mv,int bno) {
		
		if(boardService.increaseCount(bno)>0) {
			mv.addObject("b",boardService.selectBoard(bno)).setViewName("board/FreeBoardDetail");
		}else {
			mv.addObject("errorMsg","상세조회실패~").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("delete.fr")
	public String deleteBoard(int bno, String filePath,HttpSession session) {
		
		if(boardService.deleteBoard(bno)> 0) { // 삭제성공
			
			if(filePath.equals("")) { 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			
		}
		session.setAttribute("alertMsg", "삭제 성공");
		return "redirect:list.free";
	}else {
		session.setAttribute("errorMsg", "삭제 성공");
		return "common/errorPage";
	}
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
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectCommentsList(int bno) {
		return new Gson().toJson(boardService.selectCommentsList(bno));
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertComments(Comments c) {
		return boardService.insertComments(c) > 0 ? "success" : "fail";	
	}
}
