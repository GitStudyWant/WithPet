package com.project.withpet.board.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
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
import com.google.gson.JsonObject;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.common.template.Pagination;
import com.project.withpet.board.model.service.BoardService;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.BoardAttachment;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.board.model.vo.Likes;
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//자유게시판 관련
	@RequestMapping("list.free")//페이징처리및,한페이지에 보여줄 게시글수 조절
	public String selectFrList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectFrListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);;
        model.addAttribute("list", boardService.selectFrList(pi));
		return "board/FreeBoard";
	}
	@ResponseBody
	@PostMapping("select.co") //게시물 목록에서 보여주는 댓글수 
	public int getCommentCount(@RequestParam("boardNo") int boardNo) {
	    return boardService.getCommentCount(boardNo);
	}
	@ResponseBody
	@PostMapping("select.tag")//게시물 목록에서 보여주는 태그
	public ArrayList<Tag> getTag(@RequestParam("boardNo") int boardNo) {
	    return boardService.selectTagAll(boardNo);
	}
	@ResponseBody
	@PostMapping("like.bo") //좋아요숫자조회 
	public int likeCount(@RequestParam("boardNo") int boardNo) {
	    return boardService.likeCount(boardNo);
	}
	@ResponseBody
	@PostMapping("like.chk") //좋아요목록
	 public String checkLike(@RequestParam("boardNo") int boardNo,
							@RequestParam("memId") String memberId) {
		
		Likes like = new Likes();
		like.setLikeNo(boardNo);
		like.setLikeId(memberId);
		
		Likes chk = boardService.likeChk(like);
		
	    return (chk != null) ? "success" : "fail";
		
	}
	@ResponseBody
	@RequestMapping("like.add")//좋아요 누르기
	public String likeAdd(@RequestParam("boardNo") int boardNo,
            				@RequestParam("memId") String memberId) {
	Likes like = new Likes();
	like.setLikeNo(boardNo);
	like.setLikeId(memberId);
	
	Likes chk = boardService.likeChk(like);
	if (chk != null) {
		boardService.likeCancle(like);
        return "fail";
    } else {
        int result = boardService.likeAdd(like);
        return result > 0 ? "success" : "fail";
    }
	
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
	        b.setChangeName("resources/BoardFiles/" + saveFile(upfile, session));
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
			b.setChangeName("resources/BoardFiles/" + changeName);
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
	
	//자유게시판 끝
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//리뷰 게시판
	@RequestMapping("list.review")
	public String selectReList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectReListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectReList(pi));
		return "board/ReviewBoard";
	}
	
	@RequestMapping("enrollForm.re")
	public String enrollReForm() {
		return "board/ReviewBoardEnroll";
	}
	
	
	@RequestMapping("insert.review")
	public String insertReBoard(Board b,
	                            MultipartFile upfile,
	                            @RequestParam(value = "tagNames", required = false) String[] tagNames,
	                            HttpSession session,
	                            Model model) {
			
		System.out.println("전달된 태그값들은: " + Arrays.toString(tagNames));
		
	    if (!upfile.getOriginalFilename().equals("")) {
	        b.setOriginName(upfile.getOriginalFilename());
	        b.setChangeName("resources/BoardFiles/" + saveFile(upfile, session));
	    }

	    
	    if (boardService.insertReBoard(b) > 0) {// 게시글 insert시 발동(게시글 등록의 bno.nextval을 태그브릿지의 bno.currval로 쓰려고)
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
	        return "redirect:list.review";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패...");
	        return "redirect:list.review";
	    }
	}
	
	
	
	@RequestMapping("detail.re")
	public ModelAndView selectReBoard(ModelAndView mv, int bno) {
	    if (boardService.increaseCount(bno) > 0) {
	        ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
	        mv.addObject("b", boardService.selectReBoard(bno)).addObject("t", tagList).setViewName("board/ReviewBoardDetail");
	    } else {
	        mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
	    }
	    return mv;
	}
	
	@RequestMapping("delete.re")
	public String deleteReBoard(@RequestParam(value="bno")int bno, String filePath,HttpSession session) {
		
		if(boardService.deleteBoard(bno)> 0) {
			
			if(filePath.equals("")) { 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			
		}
		session.setAttribute("alertMsg", "삭제 성공");
		System.out.println(bno+"번 게시물 삭제!");
		return "redirect:list.review";
	}else {
		session.setAttribute("errorMsg", "삭제 실패");
		System.out.println(bno+"번 게시물 삭제 실패!");
		return "common/errorPage";
		 
		 
	}
	}
	@RequestMapping("updateForm.re")
	public ModelAndView updateReForm(int bno, ModelAndView mv) {
		 ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
		mv.addObject("b", boardService.selectReBoard(bno)).addObject("t", tagList).setViewName("board/ReviewBoardUpdate");
		return mv;
	}
	@RequestMapping("update.re")
	public String updateReBoard(Board b,
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
			b.setChangeName("resources/BoardFiles/" + changeName);
		}
		
		if(boardService.updateReBoard(b) >0) {
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
			return "redirect:detail.re?bno=" + b.getBoardNo();
		}else {
			session.setAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	//리뷰 게시판 끝
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//qna게시판 시작
	@RequestMapping("list.qna")
	public String selectQnList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectQnListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectQnList(pi));
		return "board/QnaBoard";
	}
	
	@RequestMapping("enrollForm.qna")
	public String enrollQnaForm() {
		return "board/QnaBoardEnroll";
	}
	
	
	@RequestMapping("insert.qna")
	public String insertQnBoard(Board b,
	                            MultipartFile upfile,
	                            @RequestParam(value = "tagNames", required = false) String[] tagNames,
	                            HttpSession session,
	                            Model model) {
			
		System.out.println("전달된 태그값들은: " + Arrays.toString(tagNames));
		
	    if (!upfile.getOriginalFilename().equals("")) {
	        b.setOriginName(upfile.getOriginalFilename());
	        b.setChangeName("resources/BoardFiles/" + saveFile(upfile, session));
	    }

	    
	    if (boardService.insertQnBoard(b) > 0) {// 게시글 insert시 발동(게시글 등록의 bno.nextval을 태그브릿지의 bno.currval로 쓰려고)
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
	        return "redirect:list.qna";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패...");
	        return "redirect:list.qna";
	    }
	}
	
	
	
	@RequestMapping("detail.qna")
	public ModelAndView selectQnBoard(ModelAndView mv, int bno) {
	    if (boardService.increaseCount(bno) > 0) {
	        ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
	        mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/QnaBoardDetail");
	    } else {
	        mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
	    }
	    return mv;
	}
	
	@RequestMapping("delete.qna")
	public String deleteQnBoard(@RequestParam(value="bno")int bno, String filePath,HttpSession session) {
		
		if(boardService.deleteBoard(bno)> 0) {
			
			if(filePath.equals("")) { 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			
		}
		session.setAttribute("alertMsg", "삭제 성공");
		System.out.println(bno+"번 게시물 삭제!");
		return "redirect:list.qna";
	}else {
		session.setAttribute("errorMsg", "삭제 실패");
		System.out.println(bno+"번 게시물 삭제 실패!");
		return "common/errorPage";
		 
		 
	}
	}
	@RequestMapping("updateForm.qna")
	public ModelAndView updateQnForm(int bno, ModelAndView mv) {
		 ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
		mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/QnaBoardUpdate");
		return mv;
	}
	@RequestMapping("update.qna")
	public String updateQnBoard(Board b,
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
			b.setChangeName("resources/BoardFiles/" + changeName);
		}
		
		if(boardService.updateQnBoard(b) >0) {
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
			return "redirect:detail.qna?bno=" + b.getBoardNo();
		}else {
			session.setAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	//qna게시판 끝
	
	
	
	
	
	
	//나눔게시판
	
	@RequestMapping("list.share")//페이징처리및,한페이지에 보여줄 게시글수 조절
	public String selectShList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
								Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectShListCount(), currentPage, 3, 10);
		model.addAttribute("pi", pi);;
        model.addAttribute("list", boardService.selectShList(pi));
		return "board/ShareBoard";
	}
	@RequestMapping("enrollForm.sh")
	public String enrollShForm() {
		return "board/ShareBoardEnroll";
	}
	
	@RequestMapping("insert.sh")
	public String insertShBoard(Board b,
	                            MultipartFile upfile,
	                            @RequestParam(value = "tagNames", required = false) String[] tagNames,
	                            HttpSession session,
	                            Model model) {
			
		System.out.println("전달된 태그값들은: " + Arrays.toString(tagNames));
		
	    if (!upfile.getOriginalFilename().equals("")) {
	        b.setOriginName(upfile.getOriginalFilename());
	        b.setChangeName("resources/BoardFiles/" + saveFile(upfile, session));
	    }

	    
	    if (boardService.insertShBoard(b) > 0) {// 게시글 insert시 발동(게시글 등록의 bno.nextval을 태그브릿지의 bno.currval로 쓰려고)
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
	        return "redirect:list.share";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패...");
	        return "redirect:list.share";
	    }
	}
	
	
	
	@RequestMapping("detail.sh")
	public ModelAndView selectShBoard(ModelAndView mv, int bno) {
	    if (boardService.increaseCount(bno) > 0) {
	        ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
	        mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/ShareBoardDetail");
	    } else {
	        mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
	    }
	    return mv;
	}
	
	@RequestMapping("delete.sh")
	public String deleteShBoard(@RequestParam(value="bno")int bno, String filePath,HttpSession session) {
		
		if(boardService.deleteBoard(bno)> 0) {
			
			if(filePath.equals("")) { 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			
		}
		session.setAttribute("alertMsg", "삭제 성공");
		System.out.println(bno+"번 게시물 삭제!");
		return "redirect:list.share";
	}else {
		session.setAttribute("errorMsg", "삭제 실패");
		System.out.println(bno+"번 게시물 삭제 실패!");
		return "common/errorPage";
		 
		 
	}
	}
	@RequestMapping("updateForm.sh")
	public ModelAndView updateShForm(int bno, ModelAndView mv) {
		 ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
		mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/ShareBoardUpdate");
		return mv;
	}
	@RequestMapping("update.sh")
	public String updateShBoard(Board b,
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
			b.setChangeName("resources/BoardFiles/" + changeName);
		}
		
		if(boardService.updateShBoard(b) >0) {
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
			return "redirect:detail.sh?bno=" + b.getBoardNo();
		}else {
			session.setAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	
	//나눔게시판 끝
	
	//크리에이터게시판
		@RequestMapping("list.creator")
		public String selectCrList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
										Model model) {
			PageInfo pi = Pagination.getPageInfo(boardService.selectCrListCount(), currentPage, 3, 10);
			model.addAttribute("pi", pi);
			model.addAttribute("list", boardService.selectCrList(pi));
			model.addAttribute("clist", boardService.selectHowList());
			return "board/Creator";
		}
		@ResponseBody
		@RequestMapping(value = "search.creator", method = RequestMethod.POST)
		public List<Board> searchCrList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
		                               @RequestParam("memNick") String memNick,
		                               Model model) {
		  System.out.println(memNick);

		  PageInfo pi = Pagination.getPageInfo(boardService.searchCrListCount(memNick), currentPage, 100, 10);
		  List<Board> boardList = boardService.searchCrList(memNick, pi);
		  System.out.println(boardList);
		  System.out.println(boardService.searchCrListCount(memNick));
		  
		  return boardList;
		}
		
		@RequestMapping("enrollForm.cr")
		public String enrollCrForm() {
			return "board/CreatorEnroll";
		}
		
		@RequestMapping("insert.cr")
		public String insertCrBoard(Board b,
		                            MultipartFile upfile,
		                            @RequestParam(value = "tagNames", required = false) String[] tagNames,
		                            HttpSession session,
		                            Model model) {
				
			System.out.println("전달된 태그값들은: " + Arrays.toString(tagNames));
			
		    if (!upfile.getOriginalFilename().equals("")) {
		        b.setOriginName(upfile.getOriginalFilename());
		        b.setChangeName("resources/BoardFiles/" + saveFile(upfile, session));
		    }

		    
		    if (boardService.insertCrBoard(b) > 0) {// 게시글 insert시 발동(게시글 등록의 bno.nextval을 태그브릿지의 bno.currval로 쓰려고)
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
		        return "redirect:list.creator";
		    } else {
		        model.addAttribute("errorMsg", "게시글 작성 실패...");
		        return "redirect:list.creator";
		    }
		}
		
		
		
		@RequestMapping("detail.cr")
		public ModelAndView selectCrBoard(ModelAndView mv, int bno) {
		    if (boardService.increaseCount(bno) > 0) {
		        ArrayList<Tag> tagList = boardService.selectTagName(bno);

		        System.out.println(tagList.size());
		        for (Tag tag : tagList) {
		            System.out.println(tag.getTagName());
		        }
		        mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/CreatorDetail");
		    } else {
		        mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
		    }
		    return mv;
		}
		
		@RequestMapping("delete.cr")
		public String deleteCrBoard(@RequestParam(value="bno")int bno, String filePath,HttpSession session) {
			
			if(boardService.deleteBoard(bno)> 0) {
				
				if(filePath.equals("")) { 
					new File(session.getServletContext().getRealPath(filePath)).delete();
				
			}
			session.setAttribute("alertMsg", "삭제 성공");
			System.out.println(bno+"번 게시물 삭제!");
			return "redirect:list.creator";
		}else {
			session.setAttribute("errorMsg", "삭제 실패");
			System.out.println(bno+"번 게시물 삭제 실패!");
			return "common/errorPage";
			 
			 
		}
		}
		@RequestMapping("updateForm.cr")
		public ModelAndView updateCrForm(int bno, ModelAndView mv) {
			 ArrayList<Tag> tagList = boardService.selectTagName(bno);

		        System.out.println(tagList.size());
		        for (Tag tag : tagList) {
		            System.out.println(tag.getTagName());
		        }
			mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/CreatorUpdate");
			return mv;
		}
		@RequestMapping("update.cr")
		public String updateCrBoard(Board b,
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
				b.setChangeName("resources/BoardFiles/" + changeName);
			}
			
			if(boardService.updateCrBoard(b) >0) {
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
				return "redirect:detail.cr?bno=" + b.getBoardNo();
			}else {
				session.setAttribute("errorMsg", "수정 실패");
				return "common/errorPage";
			}
		}
	//크리에이터게시판 끝
	
	
	
	//공지사항
	@RequestMapping("list.notice")
	public String selectNoticeList(@RequestParam(value="cPage", defaultValue = "1") int currentPage,
									Model model) {
		PageInfo pi = Pagination.getPageInfo(boardService.selectNoListCount(), currentPage, 10, 10);
		model.addAttribute("pi", pi);
		model.addAttribute("list", boardService.selectNoList(pi));
		return "board/Notice";
	}
	@RequestMapping("enrollForm.no")
	public String enrollNoForm() {
		return "board/NoticeEnroll";
	}
	
	@RequestMapping("insert.no")
	public String insertNoBoard(Board b,
	                            MultipartFile upfile,
	                            @RequestParam(value = "tagNames", required = false) String[] tagNames,
	                            HttpSession session,
	                            Model model) {
			
		System.out.println("전달된 태그값들은: " + Arrays.toString(tagNames));
		
	    if (!upfile.getOriginalFilename().equals("")) {
	        b.setOriginName(upfile.getOriginalFilename());
	        b.setChangeName("resources/BoardFiles/" + saveFile(upfile, session));
	    }

	    
	    if (boardService.insertNoBoard(b) > 0) {// 게시글 insert시 발동(게시글 등록의 bno.nextval을 태그브릿지의 bno.currval로 쓰려고)
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
	        return "redirect:list.notice";
	    } else {
	        model.addAttribute("errorMsg", "게시글 작성 실패...");
	        return "redirect:list.notice";
	    }
	}
	
	
	
	@RequestMapping("detail.no")
	public ModelAndView selectNoBoard(ModelAndView mv, int bno) {
	    if (boardService.increaseCount(bno) > 0) {
	        ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
	        mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/NoticeDetail");
	    } else {
	        mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
	    }
	    return mv;
	}
	
	@RequestMapping("delete.no")
	public String deleteNoBoard(@RequestParam(value="bno")int bno, String filePath,HttpSession session) {
		
		if(boardService.deleteBoard(bno)> 0) {
			
			if(filePath.equals("")) { 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			
		}
		session.setAttribute("alertMsg", "삭제 성공");
		System.out.println(bno+"번 게시물 삭제!");
		return "redirect:list.notice";
	}else {
		session.setAttribute("errorMsg", "삭제 실패");
		System.out.println(bno+"번 게시물 삭제 실패!");
		return "common/errorPage";
		 
		 
	}
	}
	@RequestMapping("updateForm.no")
	public ModelAndView updateNoForm(int bno, ModelAndView mv) {
		 ArrayList<Tag> tagList = boardService.selectTagName(bno);

	        System.out.println(tagList.size());
	        for (Tag tag : tagList) {
	            System.out.println(tag.getTagName());
	        }
		mv.addObject("b", boardService.selectBoard(bno)).addObject("t", tagList).setViewName("board/NoticeUpdate");
		return mv;
	}
	@RequestMapping("update.no")
	public String updateNoBoard(Board b,
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
			b.setChangeName("resources/BoardFiles/" + changeName);
		}
		
		if(boardService.updateNoBoard(b) >0) {
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
			return "redirect:detail.no?bno=" + b.getBoardNo();
		}else {
			session.setAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//댓글 조회
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectCommentsList(int bno) {
		return new Gson().toJson(boardService.selectCommentsList(bno));
	}
	// 댓글 추가
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertComments(Comments c) {
		return boardService.insertComments(c) > 0 ? "success" : "fail";	
	}
	//태그추가
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
	//첨부파일 관련
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName =upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000+10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = "WITHPET"+currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("resources/BoardFiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}		
}
