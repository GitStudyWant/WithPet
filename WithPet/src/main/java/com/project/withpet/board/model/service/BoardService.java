package com.project.withpet.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.board.model.vo.Likes;
import com.project.withpet.board.model.vo.Tag;
import com.project.withpet.board.model.vo.TagBridge;

public interface BoardService {
	
	//자유게시판
	ArrayList<Board> selectFrList(PageInfo pi);
	
	int selectFrListCount();
	
	int insertFrBoard(Board b);
	
	int updateFrBoard(Board b);
	
	
	//리뷰 게시판
	ArrayList<Board> selectReList(PageInfo pi);
	
	int selectReListCount();
	
	int insertReBoard(Board b);

	int updateReBoard(Board b);
	
	//리뷰게시판전용조회(별점까지조회)
	Board selectReBoard(int boardNo);
	
	
	
	
	//qna 게시판
	ArrayList<Board> selectQnList(PageInfo pi);
	
	int selectQnListCount();
	
	int insertQnBoard(Board b);

	int updateQnBoard(Board b);
	
	//나눔 게시판
	ArrayList<Board> selectShList(PageInfo pi);
	
	int selectShListCount();
	
	int insertShBoard(Board b);
	
	int updateShBoard(Board b);
	
	// 공지사항
	ArrayList<Board> selectNoList(PageInfo pi);

	int selectNoListCount();
	
	int insertNoBoard(Board b);

	int updateNoBoard(Board b);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//공통
	
	//조회수 증가
	int increaseCount(int boardNo);
	
	//게시판 조회
	Board selectBoard(int boardNo);
	
	//게시판 삭제
	int deleteBoard(int boardNo);
	
	//댓글 목록 조회
	ArrayList<Comments> selectCommentsList(int boardNo);
	
	//댓글 등록
	int insertComments(Comments c);
	
	//태그 등록
	int addTag(String tagName);
	
	//중복 태그명 조회
	String selectTag(String tagName);
	
	//게시물번호에 따른 태그 조회
	ArrayList<Tag> selectTagName(int boardNo);
	
	//태그명에 맞는 태그아이디찾기
	Tag selectTagId(String tagName);
	
	//태그브릿지 추가
	void insertTagBridges(List<TagBridge> tagBridges);
	
	//목록에서 댓글수 조회
	int getCommentCount(int boardNo);
	
	//목록에서 태그 조회
	ArrayList<Tag> selectTagAll(int boardNo);
	
	// 태그브릿지 수정
	void updateTagBridges(List<TagBridge> tagBridges);
	
	// 기존 태그브릿지 삭제
	void deleteTagBridges(int boardNo);
	// 목록에서 좋아요 수 조회
	int likeCount(int boardNo);
	// 좋아요 추가
	int likeAdd(Likes like);
	// 목록에서 좋아요 체크되어있나
	Likes likeChk(Likes like);
	// 좋아요 취소
	void likeCancle(Likes like);

	
	


	
	
	
	
	



	


	


	
	

	
}
