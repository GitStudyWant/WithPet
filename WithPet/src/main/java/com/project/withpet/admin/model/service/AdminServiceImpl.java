package com.project.withpet.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.admin.model.dao.AdminDao;
import com.project.withpet.trip.model.vo.Transportation;

@Service
public class AdminServiceImpl implements AdminService {
	
	
	@Autowired
	private AdminDao adminDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Transportation> adminTransportation() {
		//System.out.println("service: " + adminDao.adminTransportation(sqlSession));
		return adminDao.adminTransportation(sqlSession);
	}


	@Override
	public int addTransportation(Transportation t) {
		return adminDao.addTransportation(sqlSession, t);
	}


	@Override
	public int deleteTr(int trNo) {
		System.out.println("서비스 결과 : " + adminDao.deleteTr(sqlSession, trNo));
		return adminDao.deleteTr(sqlSession, trNo);
	}

}
