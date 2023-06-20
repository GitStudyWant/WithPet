package com.project.withpet.board.controller;


import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.common.template.Pagination;
import com.project.withpet.board.model.service.BoardService;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.BoardAttachment;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("list.free")
	public String selectFrList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectFrListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);;
        model.addAttribute("list", boardService.selectFrList(pi));
		return "board/FreeBoard";
	}
	@ResponseBody
	@PostMapping("select.co")
	public int getCommentCount(@RequestParam("boardNo") int boardNo) {
	    return boardService.getCommentCount(boardNo);
	}
	@ResponseBody
	@PostMapping("select.tag")
	public ArrayList<Tag> getTag(@RequestParam("boardNo") int boardNo) {
	    return boardService.selectTagAll(boardNo);
	}
	
	@RequestMapping("enrollForm.fr")
	public String enrollForm() {
		return "board/FreeBoardEnroll";
	}
	
	
	@RequestMapping("insert.free")
	public String insertFrBoard(Board b,
	                            MultipartFile upfile,
	                            @RequestParam(value = "tagNames", required = false) String[] tagNames,
	                            HttpSession session,
	                            Model model) {
			
		System.out.println("전달된 태그값들은: " + Arrays.toString(tagNames));
		
	    if (!upfile.getOriginalFilename().equals("")) {
	        b.setOriginName(upfile.getOriginalFilename());
	        b.setChangeName("resources/BoardFiles/Free/" + saveFile(upfile, session));
	    }

	    
	    if (boardService.insertFrBoard(b) > 0) {// 게시글 insert시 발동(게시글 등록의 bno.nextval을 태그브릿지의 bno.currval로 쓰려고)
	    	if (tagNames != null && tagNames.length > 0) {
	            List<TagBridge> tagBridges = new ArrayList<>();

	            for (String tagName : tagNames) {
	                Tag tag = boardService.selectTagId(tagName);
	                if (tag != null) {
	                    TagBridge tagBridge = new TagBridge();
	                    tagBridge.setBridgeNo(b.getBoardNo());
	                    tagBridge.setBridgeId(tag.getTagId());
	                    tagBridges.add(tagBridge);
	                }
	            }
	            if (!tagBridges.isEmpty()) {
	                boardService.insertTagBridges(tagBridges);
	            }
	        }


	        session.setAttribute("alertMsg", "게시글 등록 성공");
	        return "redirect:list.free";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패...");
	        return "redirect:list.free";
	    }
	}
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
					String originName =upfile.getOriginalFilename();
					String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
					int ranNum = (int)(Math.random() * 90000+10000);
					String ext = originName.substring(originName.lastIndexOf("."));
					String changeName = "WITHPET"+currentTime + ranNum + ext;
					String savePath = session.getServletContext().getRealPath("resources/BoardFiles/Free/");
					
					try {
						upfile.transferTo(new File(savePath+changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					return changeName;
	}		
	
	@RequestMapping("detail.fr")
	public ModelAndView selectBoard(ModelAndView mv, int bno) {
	    if (boardService.increaseCount(bno) > 0) {
	        ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
	        mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/FreeBoardDetail");
	    } else {
	        mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
	    }
	    return mv;
	}
	
	@RequestMapping("delete.fr")
	public String deleteBoard(@RequestParam(value="bno")int bno, String filePath,HttpSession session) {
		
		if(boardService.deleteBoard(bno)> 0) {
			
			if(filePath.equals("")) { 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			
		}
		session.setAttribute("alertMsg", "삭제 성공");
		System.out.println(bno+"번 게시물 삭제!");
		return "redirect:list.free";
	}else {
		session.setAttribute("errorMsg", "삭제 실패");
		System.out.println(bno+"번 게시물 삭제 실패!");
		return "common/errorPage";
		 
		 
	}
	}
	@RequestMapping("updateForm.fr")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		 ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
		mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/FreeBoardUpdate");
		return mv;
	}
	@RequestMapping("update.fr")
	public String updateFrBoard(Board b,
					            MultipartFile reUpfile,
					            @RequestParam(value = "tagNames", required = false) String[] tagNames,
					            HttpSession session,
					            Model model) {
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			String changeName = saveFile(reUpfile,session);
			
			b.setOriginName(reUpfile.getOriginalFilename());
			b.setChangeName("resources/BoardFiles/Free/" + changeName);
		}
		
		if(boardService.updateFrBoard(b) >0) {
			boardService.deleteTagBridges(b.getBoardNo());
			if (tagNames != null && tagNames.length > 0) {
	            List<TagBridge> tagBridges = new ArrayList<>();

	            for (String tagName : tagNames) {
	                Tag tag = boardService.selectTagId(tagName);
	                if (tag != null) {
	                    TagBridge tagBridge = new TagBridge();
	                    tagBridge.setBridgeNo(b.getBoardNo());
	                    tagBridge.setBridgeId(tag.getTagId());
	                    tagBridges.add(tagBridge);
	                }
	            }
	            if (!tagBridges.isEmpty()) {
	                boardService.updateTagBridges(tagBridges);
	            }
	        }
			session.setAttribute("alertMsg", "수정 성공");
			return "redirect:detail.fr?bno=" + b.getBoardNo();
		}else {
			session.setAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("list.review")
	public String selectReList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectReListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectReList(pi));
		return "board/ReviewBoard";
	}
	
	
	@RequestMapping("list.qna")
	public String selectQnList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectQnListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectQnList(pi));
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
	public String selectNoticeList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
									Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectNoListCount(), currentPage, 10, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectNoList(pi));
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
	
	@ResponseBody
	@RequestMapping(value = "addtag.bo", produces = "text/html; charset=UTF-8")
	public String addTag(@RequestBody Map<String, String> requestData) {
	    String tagName = requestData.get("tagName");
	    String dupTag = boardService.selectTag(tagName);
	    System.out.println(dupTag);
	    if(dupTag!=null) {
	    	System.out.println("중복된 태그네.");
	    	return "success";
	    }else {
	    	int result = boardService.addTag(tagName);
	    	System.out.println("새로운 태그명 추가 : " + tagName);
	    	return (result > 0) ? "success" : "fail";
	    }
	}
}
