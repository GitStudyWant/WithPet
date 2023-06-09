package com.project.withpet.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Friend;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Schedule;
import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;

@Repository
public class MemberDao {
	
	public int insertMember(SqlSession sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	public int idCheck(SqlSession sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int nickCheck(SqlSession sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	public int phoneCheck(SqlSession sqlSession, String checkPhone) {
		return sqlSession.selectOne("memberMapper.phoneCheck", checkPhone);
	}
	
	public int emailCheck(SqlSession sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}
	
	public Member selectMember(SqlSession sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.selectMember", member);
	}
	
	public int selectKakaoCount(SqlSession sqlSession, String memKakaoId) {
		return sqlSession.selectOne("memberMapper.selectKakaoCount", memKakaoId);
	}
	
	public Member selectKakaoMember(SqlSession sqlSession, String memKakaoId) {
		return sqlSession.selectOne("memberMapper.selectKakaoMember", memKakaoId);
	}
	
	public int selectMemoCount(SqlSession sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.selectMemoCount", memId);
	}
	   
	public ArrayList<Schedule> selectSchedules(SqlSession sqlSession, Schedule schedule) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSchedules", schedule);
	}
	
	public int insertSchedule(SqlSession sqlSession, Schedule schedule) {
	      return sqlSession.insert("memberMapper.insertSchedule", schedule);
	}
	
	public int updateSchedule(SqlSession sqlSession, Schedule schedule) {
	      return sqlSession.update("memberMapper.updateSchedule", schedule);
	}
	
	public int deleteSchedule(SqlSession sqlSession, int scheduleNo) {
	      return sqlSession.delete("memberMapper.deleteSchedule", scheduleNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 박민성
	
	public int sendMail(SqlSessionTemplate sqlSession, CertVO certVo) {
		return sqlSession.insert("memberMapper.sendMail", certVo);
	}
	
	public int validata(SqlSessionTemplate sqlSession, CertVO certVo) {
		CertVO result = sqlSession.selectOne("memberMapper.validate", certVo);
		int resultNum = 0;
		if(result != null) {
			resultNum = sqlSession.delete("memberMapper.remove", certVo);
		}
		return resultNum;
	}
	
	public Member idFind(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.idFind", email);
	}
	
	public int pwdMail(SqlSessionTemplate sqlSession, CertVO certVo) {
		return sqlSession.insert("memberMapper.pwdMail", certVo);
	}
	
	public int pwdFind(SqlSessionTemplate sqlSession, Passward p) {
		return sqlSession.update("memberMapper.pwdFind", p);
	}
	
	public ArrayList<Board> myPage(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myPage", pi, rowBounds);
	}
	
	public int boardCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.boardCount", memberId);
	}
	
	public int replyCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.replyCount", memberId);
	}
	
	public ArrayList<Comments> myPageReply(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myPageReply", pi, rowBounds);
	}
	
	public int likeCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.likeCount", memberId);
	}
	
	public ArrayList<Board> myPageLike(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myPageLike", pi, rowBounds);
	}
	
	public int deleteCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.deleteCount", memberId);
	}
	
	public ArrayList<Board> myPageDelete(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myPageDelete", pi, rowBounds);
	}
	
	public int friendCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.friendCount", memberId);
	}
	
	public ArrayList<Member> myPageFriend(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myPageFriend", pi, rowBounds);
	}

	public int friendDelete(SqlSessionTemplate sqlSession, Friend fri) {
		return sqlSession.delete("memberMapper.friendDelete", fri);
	}
	
	public int freindSharing(SqlSessionTemplate sqlSession, Friend fri) {
		return sqlSession.insert("memberMapper.freindSharing", fri);
	}
	
	public int sharingCancellation(SqlSessionTemplate sqlSession, Friend fri) {
		return sqlSession.delete("memberMapper.sharingCancellation", fri);
	}
	
	public Member friendSearch(SqlSessionTemplate sqlSession, Friend fri) {
		return sqlSession.selectOne("memberMapper.friendSearch", fri);
	}

	public ArrayList<Place> myCourse(SqlSessionTemplate sqlSession, String memId) {
		return (ArrayList)sqlSession.selectList("memberMapper.myCourse", memId);
	}

	public int deleteCourse(SqlSessionTemplate sqlSession, MyPlace m) {
		return sqlSession.delete("memberMapper.deleteCourse", m);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
