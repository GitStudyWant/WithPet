package com.project.withpet.cafe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.cafe.model.dao.CafeDao;
import com.project.withpet.cafe.model.vo.Cafe;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.common.model.vo.PageInfo;

@Service
public class CafeServiceImpl implements CafeService {

	@Autowired
	private CafeDao cafeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return cafeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Cafe> selectList(PageInfo pi) {
		return cafeDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertCafe(Cafe c) {
		return cafeDao.insertCafe(sqlSession, c);
	}

	@Override
	public Cafe cafeInfo(int cafeNo) {
		return cafeDao.cafeInfo(sqlSession, cafeNo);
	}

	@Override
	public int cafeReservation(CafeRes r) {
		return cafeDao.cafeReservation(sqlSession, r);
	}

	@Override
	public int findCafeNo(CafeRes r) {
		return cafeDao.findCafeNo(sqlSession, r);
	}

	
	
	
	
	
}
